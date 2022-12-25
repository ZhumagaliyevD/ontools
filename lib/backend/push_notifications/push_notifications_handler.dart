import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Untitled_design_(1).png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'EntryPage': (data) async => EntryPageWidget(),
  'PhoneEntryPage': (data) async => PhoneEntryPageWidget(),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser:
            await getDocumentParameter(data, 'chatUser', UserRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'PhoneVerify': (data) async => PhoneVerifyWidget(),
  'SignUpPage': (data) async => SignUpPageWidget(),
  'ContinueSignupPage': (data) async => ContinueSignupPageWidget(),
  'ReportsPage': (data) async => NavBarPage(initialPage: 'ReportsPage'),
  'MyToolsPage': (data) async => NavBarPage(initialPage: 'MyToolsPage'),
  'AddNewToolPage': (data) async => AddNewToolPageWidget(),
  'EditToolPage': (data) async => EditToolPageWidget(
        tool: await getDocumentParameter(data, 'tool', ToolsRecord.serializer),
      ),
  'ProfileEditPage': (data) async => ProfileEditPageWidget(),
  'Notes': (data) async => NavBarPage(initialPage: 'Notes'),
  'PointsPage': (data) async => PointsPageWidget(
        notepage: await getDocumentParameter(
            data, 'notepage', NotesRecord.serializer),
      ),
  'AuthPage': (data) async => AuthPageWidget(),
  'AllChats': (data) async => AllChatsWidget(),
  'createPointsPage': (data) async => CreatePointsPageWidget(),
  'Marketplace': (data) async => NavBarPage(initialPage: 'Marketplace'),
  'EditPointsPage': (data) async => EditPointsPageWidget(
        note: await getDocumentParameter(data, 'note', NotesRecord.serializer),
      ),
  'Paywall': (data) async => PaywallWidget(),
  'PainterPage': (data) async => PainterPageWidget(
        noteIMG:
            await getDocumentParameter(data, 'noteIMG', NotesRecord.serializer),
      ),
  'ToolDetailPage': (data) async => ToolDetailPageWidget(
        tool: await getDocumentParameter(data, 'tool', ToolsRecord.serializer),
      ),
  'MyPurchases': (data) async => NavBarPage(initialPage: 'MyPurchases'),
  'AddPurchase': (data) async => AddPurchaseWidget(),
  'EditPurchase': (data) async => EditPurchaseWidget(
        toolPurchase: await getDocumentParameter(
            data, 'toolPurchase', PurchaseRecord.serializer),
      ),
  'PurchaseDetail': (data) async => PurchaseDetailWidget(
        toolPurchase: await getDocumentParameter(
            data, 'toolPurchase', PurchaseRecord.serializer),
      ),
  'About': (data) async => AboutWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
