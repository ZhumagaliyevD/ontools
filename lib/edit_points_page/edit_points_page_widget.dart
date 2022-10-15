import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_note_elements_widget.dart';
import '../components/add_note_settings_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EditPointsPageWidget extends StatefulWidget {
  const EditPointsPageWidget({
    Key? key,
    this.note,
  }) : super(key: key);

  final NotesRecord? note;

  @override
  _EditPointsPageWidgetState createState() => _EditPointsPageWidgetState();
}

class _EditPointsPageWidgetState extends State<EditPointsPageWidget> {
  BulletsRecord? bullet;
  TextEditingController? optionController;
  TextEditingController? noteDescriptionController;
  TextEditingController? noteTitleController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    noteDescriptionController =
        TextEditingController(text: widget.note!.description);
    noteTitleController = TextEditingController(text: widget.note!.title);
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
        List<NotesRecord> editPointsPageNotesRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final editPointsPageNotesRecord =
            editPointsPageNotesRecordList.isNotEmpty
                ? editPointsPageNotesRecordList.first
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
                await editPointsPageNotesRecord!.reference.delete();
                setState(() => FFAppState().noteIMG = '');
                context.pop();
              },
            ),
            title: Text(
              'Редактировать заметку',
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
                  if (FFAppState().noteIMG != null &&
                      FFAppState().noteIMG != '') {
                    final notesUpdateData = createNotesRecordData(
                      title: noteTitleController!.text,
                      description: noteDescriptionController!.text,
                      createdBy: currentUserReference,
                      createdAt: getCurrentTimestamp,
                      image: FFAppState().noteIMG,
                    );
                    await editPointsPageNotesRecord!.reference
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
                    return;
                  }

                  setState(() => FFAppState().noteIMG = '');

                  context.pushNamed('Notes');
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
                                  parent: editPointsPageNotesRecord!.reference,
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
                                                  editPointsPageNotesRecord!
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
                          if (editPointsPageNotesRecord != null)
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              child: custom_widgets.PhotoNoteWidget(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 1,
                                image: editPointsPageNotesRecord!.image!,
                                points: editPointsPageNotesRecord!.notePoints!
                                    .toList(),
                                onCreatePhotoNote: () async {},
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
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: AddNoteElementsWidget(
                                  uploadImage: () async {},
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
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
