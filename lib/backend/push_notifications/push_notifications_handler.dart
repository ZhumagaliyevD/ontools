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
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
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

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get params => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'EntryPage': ParameterData.none(),
  'PhoneEntryPage': ParameterData.none(),
  'ChatPage': (data) async => ParameterData(
        allParams: {
          'chatUser': await getDocumentParameter<UserRecord>(
              data, 'chatUser', UserRecord.serializer),
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'PhoneVerify': ParameterData.none(),
  'SignUpPage': ParameterData.none(),
  'ContinueSignupPage': ParameterData.none(),
  'ReportsPage': ParameterData.none(),
  'ProfileHomePage': ParameterData.none(),
  'MyToolsPage': ParameterData.none(),
  'AddNewToolPage': ParameterData.none(),
  'EditToolPage': (data) async => ParameterData(
        allParams: {
          'tool': await getDocumentParameter<ToolsRecord>(
              data, 'tool', ToolsRecord.serializer),
        },
      ),
  'ProfileEditPage': ParameterData.none(),
  'Notes': ParameterData.none(),
  'PointsPage': (data) async => ParameterData(
        allParams: {
          'notepage': await getDocumentParameter<NotesRecord>(
              data, 'notepage', NotesRecord.serializer),
        },
      ),
  'AuthPage': ParameterData.none(),
  'AllChats': ParameterData.none(),
  'createPointsPage': ParameterData.none(),
  'Marketplace': ParameterData.none(),
  'EditPointsPage': (data) async => ParameterData(
        allParams: {
          'note': await getDocumentParameter<NotesRecord>(
              data, 'note', NotesRecord.serializer),
        },
      ),
  'Paywall': ParameterData.none(),
  'PainterPage': (data) async => ParameterData(
        allParams: {
          'noteIMG': await getDocumentParameter<NotesRecord>(
              data, 'noteIMG', NotesRecord.serializer),
        },
      ),
  'ToolDetailPage': (data) async => ParameterData(
        allParams: {
          'tool': await getDocumentParameter<ToolsRecord>(
              data, 'tool', ToolsRecord.serializer),
        },
      ),
  'MyPurchases': ParameterData.none(),
  'AddPurchase': ParameterData.none(),
  'EditPurchase': (data) async => ParameterData(
        allParams: {
          'toolPurchase': await getDocumentParameter<PurchaseRecord>(
              data, 'toolPurchase', PurchaseRecord.serializer),
        },
      ),
  'PurchaseDetail': (data) async => ParameterData(
        allParams: {
          'toolPurchase': await getDocumentParameter<PurchaseRecord>(
              data, 'toolPurchase', PurchaseRecord.serializer),
        },
      ),
  'About': ParameterData.none(),
};

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
