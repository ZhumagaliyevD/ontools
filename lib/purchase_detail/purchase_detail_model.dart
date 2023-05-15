import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PurchaseDetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Tool_name widget.
  TextEditingController? toolNameController;
  String? Function(BuildContext, String?)? toolNameControllerValidator;
  // State field(s) for Tool_name2 widget.
  TextEditingController? toolName2Controller;
  String? Function(BuildContext, String?)? toolName2ControllerValidator;
  // State field(s) for price widget.
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    toolNameController?.dispose();
    toolName2Controller?.dispose();
    priceController?.dispose();
  }

  /// Additional helper methods are added here.

}
