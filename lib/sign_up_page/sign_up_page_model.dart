import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email_signUp widget.
  TextEditingController? emailSignUpController;
  String? Function(BuildContext, String?)? emailSignUpControllerValidator;
  // State field(s) for Password_signUp widget.
  TextEditingController? passwordSignUpController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)? passwordSignUpControllerValidator;
  // State field(s) for ConfPassword_signUp widget.
  TextEditingController? confPasswordSignUpController;
  late bool confPasswordSignUpVisibility;
  String? Function(BuildContext, String?)?
      confPasswordSignUpControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordSignUpVisibility = false;
    confPasswordSignUpVisibility = false;
  }

  void dispose() {
    emailSignUpController?.dispose();
    passwordSignUpController?.dispose();
    confPasswordSignUpController?.dispose();
  }

  /// Additional helper methods are added here.

}
