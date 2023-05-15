import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePointsPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for NoteTitle widget.
  TextEditingController? noteTitleController;
  String? Function(BuildContext, String?)? noteTitleControllerValidator;
  String? _noteTitleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0j7vnj1w' /* Обязательно к заполнению */,
      );
    }

    return null;
  }

  // State field(s) for NoteDescription widget.
  TextEditingController? noteDescriptionController;
  String? Function(BuildContext, String?)? noteDescriptionControllerValidator;
  // State field(s) for option widget.
  TextEditingController? optionController;
  String? Function(BuildContext, String?)? optionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  BulletsRecord? bullet;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // Stores action output result for [Backend Call - Create Document] action in PhotoNoteWidget widget.
  PhotoNotePointRecord? createdPoint;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    noteTitleControllerValidator = _noteTitleControllerValidator;
  }

  void dispose() {
    noteTitleController?.dispose();
    noteDescriptionController?.dispose();
    optionController?.dispose();
  }

  /// Additional helper methods are added here.

}
