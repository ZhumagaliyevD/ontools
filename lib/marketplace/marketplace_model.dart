import '/backend/backend.dart';
import '/components/filter_widget.dart';
import '/components/sort_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MarketplaceModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MarketSearch widget.
  TextEditingController? marketSearchController;
  String? Function(BuildContext, String?)? marketSearchControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    marketSearchController?.dispose();
  }

  /// Additional helper methods are added here.

}
