import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/add_note_settings_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePointsPageWidget extends StatefulWidget {
  const CreatePointsPageWidget({Key? key}) : super(key: key);

  @override
  _CreatePointsPageWidgetState createState() => _CreatePointsPageWidgetState();
}

class _CreatePointsPageWidgetState extends State<CreatePointsPageWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  BulletsRecord? bullet;
  TextEditingController? optionController;
  TextEditingController? noteDescriptionController;
  TextEditingController? noteTitleController;
  PhotoNotePointRecord? photoNotePointOutput;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    noteDescriptionController = TextEditingController();
    noteTitleController = TextEditingController();
    optionController = TextEditingController();
  }

  @override
  void dispose() {
    noteDescriptionController?.dispose();
    noteTitleController?.dispose();
    optionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NotesRecord>>(
      stream: queryNotesRecord(
        queryBuilder: (notesRecord) => notesRecord
            .where('created_by', isEqualTo: currentUserReference)
            .orderBy('created_at', descending: true),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ),
          );
        }
        List<NotesRecord> createPointsPageNotesRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final createPointsPageNotesRecord =
            createPointsPageNotesRecordList.isNotEmpty
                ? createPointsPageNotesRecordList.first
                : null;
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
                size: 30,
              ),
              onPressed: () async {
                await createPointsPageNotesRecord!.reference.delete();
                setState(() => FFAppState().noteIMG = '');
                context.pop();
              },
            ),
            title: Text(
              'Создать заметку',
              style: FlutterFlowTheme.of(context).subtitle1,
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: FaIcon(
                  FontAwesomeIcons.save,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30,
                ),
                onPressed: () async {
                  var _shouldSetState = false;
                  if (uploadedFileUrl != null && uploadedFileUrl != '') {
                    final photoNotePointCreateData =
                        createPhotoNotePointRecordData(
                      dx: 170.1,
                      dy: 120.21,
                      description: 'from ff',
                    );
                    var photoNotePointRecordReference =
                        PhotoNotePointRecord.collection.doc();
                    await photoNotePointRecordReference
                        .set(photoNotePointCreateData);
                    photoNotePointOutput =
                        PhotoNotePointRecord.getDocumentFromData(
                            photoNotePointCreateData,
                            photoNotePointRecordReference);
                    _shouldSetState = true;
                    setState(() => FFAppState().photoNotePoints = []);
                    setState(() => FFAppState()
                        .photoNotePoints
                        .add(photoNotePointOutput!.reference));

                    final notesUpdateData = {
                      ...createNotesRecordData(
                        title: noteTitleController!.text,
                        description: noteDescriptionController!.text,
                        createdBy: currentUserReference,
                        createdAt: getCurrentTimestamp,
                        image: uploadedFileUrl,
                        isCheckbox: false,
                      ),
                      'note_points': FFAppState().photoNotePoints,
                    };
                    await createPointsPageNotesRecord!.reference
                        .update(notesUpdateData);
                  } else {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: Text('Ошибка создания'),
                          content: Text('Изображение отсутствует'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                    if (_shouldSetState) setState(() {});
                    return;
                  }

                  setState(() => FFAppState().noteIMG = '');
                  setState(() => FFAppState().photoNotePoints = []);

                  context.pushNamed('Notes');

                  if (_shouldSetState) setState(() {});
                },
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                            child: TextFormField(
                              controller: noteTitleController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Название заметки',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
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
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText2,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Обязательно к заполнению';
                                }

                                return null;
                              },
                            ),
                          ),
                          if (FFAppState().isCheckbox == false)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                              child: TextFormField(
                                controller: noteDescriptionController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Начните писать',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
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
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                            ),
                          if (FFAppState().isCheckbox == true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                              child: StreamBuilder<List<BulletsRecord>>(
                                stream: queryBulletsRecord(
                                  parent:
                                      createPointsPageNotesRecord!.reference,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<BulletsRecord> columnBulletsRecordList =
                                      snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnBulletsRecordList.length,
                                        (columnIndex) {
                                      final columnBulletsRecord =
                                          columnBulletsRecordList[columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
                                              children: [
                                                if (columnBulletsRecord
                                                        .isDone ==
                                                    false)
                                                  InkWell(
                                                    onTap: () async {
                                                      final bulletsUpdateData =
                                                          createBulletsRecordData(
                                                        isDone: true,
                                                      );
                                                      await columnBulletsRecord
                                                          .reference
                                                          .update(
                                                              bulletsUpdateData);
                                                    },
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                if (columnBulletsRecord
                                                        .isDone ==
                                                    true)
                                                  InkWell(
                                                    onTap: () async {
                                                      final bulletsUpdateData =
                                                          createBulletsRecordData(
                                                        isDone: false,
                                                      );
                                                      await columnBulletsRecord
                                                          .reference
                                                          .update(
                                                              bulletsUpdateData);
                                                    },
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          width: 1,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Text(
                                                columnBulletsRecord.text!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                          if (FFAppState().isCheckbox == true)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: optionController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Начните писать',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
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
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        if (optionController!.text == null ||
                                            optionController!.text == '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Добавь параметр'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          final bulletsCreateData =
                                              createBulletsRecordData(
                                            isDone: false,
                                            text: optionController!.text,
                                          );
                                          var bulletsRecordReference =
                                              BulletsRecord.createDoc(
                                                  createPointsPageNotesRecord!
                                                      .reference);
                                          await bulletsRecordReference
                                              .set(bulletsCreateData);
                                          bullet =
                                              BulletsRecord.getDocumentFromData(
                                                  bulletsCreateData,
                                                  bulletsRecordReference);
                                        }

                                        setState(() {
                                          optionController?.clear();
                                        });

                                        setState(() {});
                                      },
                                      child: Text(
                                        '+ Новый пункт',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (createPointsPageNotesRecord != null)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                child: custom_widgets.PhotoNoteWidget(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  image: uploadedFileUrl,
                                  onCreatePhotoNote: () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 1));
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
                            setState(() => isMediaUploading = true);
                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              isMediaUploading = false;
                            }
                            if (downloadUrls.length == selectedMedia.length) {
                              setState(
                                  () => uploadedFileUrl = downloadUrls.first);
                              showUploadMessage(context, 'Success!');
                            } else {
                              setState(() {});
                              showUploadMessage(
                                  context, 'Failed to upload media');
                              return;
                            }
                          }
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        fillColor: Color(0x06232323),
                        icon: Icon(
                          FFIcons.kmenuDots,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: AddNoteSettingsWidget(),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
