import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({Key? key}) : super(key: key);

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 25,
          ),
          onPressed: () async {
            context.pushNamed('ProfileHomePage');
          },
        ),
        title: Text(
          'О приложении',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0, -0.8),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'We made it so you can take good care of your work tools, and in return they’ll take care of you.\nAlways have access to your digital tool box, on any device, in any place.\nSave, manage, track, keep receipts, and notes.\nAs you progress through your apprenticeship, out of pocket tool purchases add up.\nYou need to know what tools you own, how much was spent on them, and where they are, i.e work van, toolbox, shop floor, etc.\nYou want to keep more of your money and event get some back by claiming tool allowance tax deductions.\nIf you carry tool insurance, prove ownership by saving receipts digitally, no more paperwork.\nGet a mobile app that records your tools, storing the data securely on a cloud.\nYour toolbox is digitized, with complete purchase history and copies of receipts.\nSave reports to assist tax and insurance claims.\nCreate and keep notes related to your jobs and tools.\nAccess a tool marketplace shared by fellow tradespeople.\nOnTools uses:\nGoogle Cloud platform to provide security and scalability.\nProgressive web app format for flexibility and online performance on both Android and iOS devices.\nOCR technology for document scanning to avoid manual entry.',
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
