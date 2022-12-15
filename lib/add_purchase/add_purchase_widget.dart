import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddPurchaseWidget extends StatefulWidget {
  const AddPurchaseWidget({Key? key}) : super(key: key);

  @override
  _AddPurchaseWidgetState createState() => _AddPurchaseWidgetState();
}

class _AddPurchaseWidgetState extends State<AddPurchaseWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? toolNameController;
  DateTime? datePicked;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().viewPhoto = false;
      });
    });

    toolNameController = TextEditingController();
  }

  @override
  void dispose() {
    toolNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
            setState(() {
              FFAppState().toolimg = '';
              FFAppState().toolBuyDate =
                  DateTime.fromMillisecondsSinceEpoch(1665846120000);
            });
            setState(() {
              FFAppState().chequeName = '';
            });
          },
        ),
        title: Text(
          'Add Purchase',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                    child: TextFormField(
                      controller: toolNameController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Tool name',
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).lineColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      if (FFAppState().chequeName != null &&
                                          FFAppState().chequeName != '') {
                                        setState(() {
                                          FFAppState().viewPhoto = true;
                                        });
                                      }
                                    },
                                    child: Text(
                                      valueOrDefault<String>(
                                        FFAppState().chequeName,
                                        'Добавить чек',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: (FFAppState().chequeName !=
                                                            null &&
                                                        FFAppState()
                                                                .chequeName !=
                                                            '') &&
                                                    (FFAppState()
                                                                .chequeImg !=
                                                            null &&
                                                        FFAppState()
                                                                .chequeImg !=
                                                            '')
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryColor
                                                : FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              if (FFAppState().chequeName != null &&
                                  FFAppState().chequeName != '')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  icon: Icon(
                                    FFIcons.kcrossCircle,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      FFAppState().chequeName = '';
                                      FFAppState().chequeImg = '';
                                    });
                                    setState(() {
                                      FFAppState().viewPhoto = false;
                                    });
                                  },
                                ),
                              if (FFAppState().chequeName == null ||
                                  FFAppState().chequeName == '')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  icon: Icon(
                                    FFIcons.kfreeIconFontDownload3917330,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    final selectedFile = await selectFile(
                                        allowedExtensions: ['pdf']);
                                    if (selectedFile != null) {
                                      setState(() => isMediaUploading = true);
                                      String? downloadUrl;
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        downloadUrl = await uploadData(
                                            selectedFile.storagePath,
                                            selectedFile.bytes);
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        isMediaUploading = false;
                                      }
                                      if (downloadUrl != null) {
                                        setState(() =>
                                            uploadedFileUrl = downloadUrl!);
                                        showUploadMessage(
                                          context,
                                          'Success!',
                                        );
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                          context,
                                          'Failed to upload file',
                                        );
                                        return;
                                      }
                                    }

                                    if (uploadedFileUrl != null &&
                                        uploadedFileUrl != '') {
                                      setState(() {
                                        FFAppState().chequeName =
                                            'Чек ${dateTimeFormat('d/M H:mm', getCurrentTimestamp)}';
                                        FFAppState().chequeImg =
                                            uploadedFileUrl;
                                      });
                                    }
                                  },
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 2),
                                  child: Text(
                                    'Дата покупки',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePickedDate != null) {
                                      setState(
                                        () => datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        ),
                                      );
                                    }
                                    if (!(datePicked == null)) {
                                      setState(() {
                                        FFAppState().toolBuyDate = datePicked;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat('d/M/y', datePicked),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 30),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (formKey.currentState == null ||
                            !formKey.currentState!.validate()) {
                          return;
                        }

                        if (uploadedFileUrl != null && uploadedFileUrl != '') {
                          final purchaseCreateData = createPurchaseRecordData(
                            createdBy: currentUserReference,
                            createdAt: getCurrentTimestamp,
                            chequeName: FFAppState().chequeName,
                            toolName: toolNameController!.text,
                            chqueImg: uploadedFileUrl,
                            buyDate: datePicked,
                          );
                          await PurchaseRecord.collection
                              .doc()
                              .set(purchaseCreateData);
                        } else {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Empty Value'),
                                content: Text(
                                    'Please make sure that all data are filled and set'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        setState(() {
                          FFAppState().toolimg = '';
                          FFAppState().chequeName = '';
                        });
                        setState(() {
                          FFAppState().chequeImg = '';
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Purchase added',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0x00000000),
                          ),
                        );

                        context.pushNamed('MyPurchases');
                      },
                      text: 'Save',
                      options: FFButtonOptions(
                        width: 130,
                        height: 48,
                        color: FlutterFlowTheme.of(context).secondaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if ((FFAppState().viewPhoto == true) &&
                (FFAppState().chequeImg != null &&
                    FFAppState().chequeImg != '') &&
                (FFAppState().chequeImg != ''))
              InkWell(
                onTap: () async {
                  setState(() {
                    FFAppState().viewPhoto = false;
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x7C000000),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          FFAppState().viewPhoto = false;
                        });
                      },
                      child: Image.network(
                        FFAppState().chequeImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
