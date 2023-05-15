import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditToolPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for Tool_name widget.
  TextEditingController? toolNameController;
  String? Function(BuildContext, String?)? toolNameControllerValidator;
  String? _toolNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '173p52vv' /* Обязательное поле */,
      );
    }

    return null;
  }

  // State field(s) for Description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'a5b86i6k' /* Обязательное поле */,
      );
    }

    return null;
  }

  // State field(s) for ShopName widget.
  TextEditingController? shopNameController;
  String? Function(BuildContext, String?)? shopNameControllerValidator;
  String? _shopNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tsrtpde8' /* Обязательное поле */,
      );
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  DateTime? datePicked;
  // State field(s) for price widget.
  TextEditingController? priceController;
  String? Function(BuildContext, String?)? priceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toolNameControllerValidator = _toolNameControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
    shopNameControllerValidator = _shopNameControllerValidator;
  }

  void dispose() {
    toolNameController?.dispose();
    descriptionController?.dispose();
    shopNameController?.dispose();
    priceController?.dispose();
  }

  /// Additional helper methods are added here.

}
