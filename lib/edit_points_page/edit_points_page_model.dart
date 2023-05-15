import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_note_elements_widget.dart';
import '/components/add_note_settings_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditPointsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NoteTitle widget.
  TextEditingController? noteTitleController;
  String? Function(BuildContext, String?)? noteTitleControllerValidator;
  // State field(s) for NoteDescription widget.
  TextEditingController? noteDescriptionController;
  String? Function(BuildContext, String?)? noteDescriptionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in PhotoNoteWidget widget.
  PhotoNotePointRecord? createdPoint;
  // State field(s) for option widget.
  TextEditingController? optionController;
  String? Function(BuildContext, String?)? optionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  BulletsRecord? bullet;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    noteTitleController?.dispose();
    noteDescriptionController?.dispose();
    optionController?.dispose();
  }

  /// Additional helper methods are added here.

}
