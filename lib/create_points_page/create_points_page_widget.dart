import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  String? choiceChipsValue;
  PhotoNotePointRecord? createdPoint;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    noteDescriptionController = TextEditingController();
    noteTitleController = TextEditingController();
    optionController = TextEditingController();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    noteDescriptionController?.dispose();
    noteTitleController?.dispose();
    optionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<NotesRecord>>(
      stream: queryNotesRecord(
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
        // Return an empty Container when the item does not exist.
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
                FFAppState().update(() {
                  FFAppState().noteIMG = '';
                });
                context.pop();
              },
            ),
            title: Text(
              FFLocalizations.of(context).getText(
                'yre4l98x' /* Создать заметку */,
              ),
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
                  if (uploadedFileUrl != null && uploadedFileUrl != '') {
                    final notesCreateData = {
                      ...createNotesRecordData(
                        title: noteTitleController!.text,
                        description: noteDescriptionController!.text,
                        isCheckbox: false,
                        image: uploadedFileUrl,
                        createdBy: currentUserReference,
                        createdAt: getCurrentTimestamp,
                      ),
                      'note_points': FFAppState().photoNotePoints,
                    };
                    await NotesRecord.collection.doc().set(notesCreateData);
                    FFAppState().update(() {
                      FFAppState().photoNotePoints = [];
                    });
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
                    return;
                  }

                  FFAppState().update(() {
                    FFAppState().noteIMG = '';
                    FFAppState().photoNotePoints = [];
                  });

                  context.pushNamed('Notes');
                },
              ),
            ],
            centerTitle: true,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                                labelText: FFLocalizations.of(context).getText(
                                  'r9rfk6rh' /* Название заметки */,
                                ),
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
                                  return FFLocalizations.of(context).getText(
                                    '0j7vnj1w' /* Обязательно к заполнению */,
                                  );
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
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'opxmprue' /* Начните писать */,
                                  ),
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
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'ua78911f' /* Начните писать */,
                                      ),
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
                                        FFLocalizations.of(context).getText(
                                          'zsp9mljc' /* + Новый пункт */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (uploadedFileUrl != null && uploadedFileUrl != '')
                            FlutterFlowChoiceChips(
                              initiallySelected: [
                                FFLocalizations.of(context).getText(
                                  'w5yq23iy' /* Comment */,
                                )
                              ],
                              options: [
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'b56avqfi' /* Draw */,
                                    ),
                                    FontAwesomeIcons.pen),
                                ChipData(
                                    FFLocalizations.of(context).getText(
                                      'i89uw3y1' /* Comment */,
                                    ),
                                    Icons.add_comment)
                              ],
                              onChanged: (val) =>
                                  setState(() => choiceChipsValue = val?.first),
                              selectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFF323B45),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                iconColor: Colors.white,
                                iconSize: 18,
                                elevation: 4,
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF323B45),
                                    ),
                                iconColor: Color(0xFF323B45),
                                iconSize: 18,
                                elevation: 4,
                              ),
                              chipSpacing: 20,
                              multiselect: false,
                              initialized: choiceChipsValue != null,
                              alignment: WrapAlignment.start,
                            ),
                          if ((createPointsPageNotesRecord != null) &&
                              (uploadedFileUrl != null &&
                                  uploadedFileUrl != '') &&
                              (choiceChipsValue == 'Comment'))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: custom_widgets.PhotoNoteWidget(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  image: uploadedFileUrl,
                                  points: createPointsPageNotesRecord!
                                      .notePoints!
                                      .toList(),
                                  onCreatePhotoNote: () async {
                                    await Future.delayed(
                                        const Duration(milliseconds: 1));

                                    final photoNotePointCreateData =
                                        createPhotoNotePointRecordData(
                                      dx: FFAppState().dx,
                                      dy: FFAppState().dy,
                                      description: FFAppState().comment,
                                    );
                                    var photoNotePointRecordReference =
                                        PhotoNotePointRecord.collection.doc();
                                    await photoNotePointRecordReference
                                        .set(photoNotePointCreateData);
                                    createdPoint = PhotoNotePointRecord
                                        .getDocumentFromData(
                                            photoNotePointCreateData,
                                            photoNotePointRecordReference);
                                    FFAppState().update(() {
                                      FFAppState().addToPhotoNotePoints(
                                          createdPoint!.reference);
                                      FFAppState().comment = '';
                                    });
                                    FFAppState().update(() {
                                      FFAppState().dx = 0.0;
                                      FFAppState().dy = 0.0;
                                    });

                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          if ((createPointsPageNotesRecord != null) &&
                              (uploadedFileUrl != null &&
                                  uploadedFileUrl != '') &&
                              (choiceChipsValue != 'Comment'))
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                            ),
                          if (uploadedFileUrl == null || uploadedFileUrl == '')
                            Text(
                              FFLocalizations.of(context).getText(
                                '0w2weuw5' /* Пожалуйста добавьте фото,
Нажм... */
                                ,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
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
                          size: 45,
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
