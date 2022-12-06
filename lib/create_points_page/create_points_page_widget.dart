import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/add_note_settings_widget.dart';
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
import 'package:flutter_painter/flutter_painter.dart';
import 'package:image_painter/image_painter.dart';
import 'dart:io' as f;
import 'package:path_provider/path_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'dart:ui' as ui;
//import 'package:flutter_image_compress/flutter_image_compress.dart';

class CreatePointsPageWidget extends StatefulWidget {
  const CreatePointsPageWidget({
    Key? key,
    this.currentNote,
  }) : super(key: key);

  final DocumentReference? currentNote;

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
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? urlNote;
  UploadTask? updTask;
  int fileHash = 0;
  final _imageKey = GlobalKey<ImagePainterState>();
  var downloadUrll;
  f.File? file;

  static const Color red = Color(0xFFFF0000);
  FocusNode textFocusNode = FocusNode();
  late PainterController controller;
  ui.Image? backgroundImage;
  Paint shapePaint = Paint()
    ..strokeWidth = 5
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  PhotoNotePointRecord? photoNotePointOutput;

  void initBackground() async {
    final image = await NetworkImage(uploadedFileUrl!).image;
    setState(() {
      backgroundImage = image;
      controller.background = image.backgroundDrawable;
    });
  }

  @override
  void initState() {
    super.initState();
    noteDescriptionController = TextEditingController();
    noteTitleController = TextEditingController();
    optionController = TextEditingController();

    super.initState();
    controller = PainterController(
        settings: PainterSettings(
            text: TextSettings(
              focusNode: textFocusNode,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: red, fontSize: 18),
            ),
            freeStyle: const FreeStyleSettings(
              color: red,
              strokeWidth: 5,
            ),
            shape: ShapeSettings(
              paint: shapePaint,
            ),
            scale: const ScaleSettings(
              enabled: true,
              minScale: 1,
              maxScale: 5,
            )));
    noteDescriptionController = TextEditingController();
    noteTitleController = TextEditingController();
    optionController = TextEditingController();
    textFocusNode.addListener(onFocus);
    // Initialize background
    //initBackground();
  }

  void onFocus() {
    setState(() {});
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
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, _, __) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterFlowIconButton(
              borderColor: Colors.white60,
              borderRadius: 37,
              borderWidth: 1,
              buttonSize: 74,
              icon: Icon(
                Icons.add_circle_outline,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 42,
              ),
              onPressed: () async {
                final selectedMedia = await selectMediaWithSourceBottomSheet(
                  context: context,
                  allowPhoto: true,
                );
                if (selectedMedia != null &&
                    selectedMedia.every(
                        (m) => validateFileFormat(m.storagePath, context))) {
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
                        (m) async => await uploadData(m.storagePath, m.bytes),
                      ),
                    ))
                        .where((u) => u != null)
                        .map((u) => u!)
                        .toList();
                  } finally {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    isMediaUploading = false;
                  }
                  if (downloadUrls.length == selectedMedia.length) {
                    setState(() {
                      fileHash = downloadUrls.hashCode;
                      uploadedFileUrl = downloadUrls.first;
                      downloadUrll = downloadUrls[0];
                    });
                    initBackground();
                    showUploadMessage(context, 'Success!');
                  } else {
                    setState(() {});
                    showUploadMessage(context, 'Failed to upload media');
                    return;
                  }
                  Uri myUri = Uri.parse(uploadedFileUrl!);
                  final http.Response responseData = await http.get(myUri);
                  var uint8list = responseData.bodyBytes;
                  var buffer = uint8list.buffer;
                  ByteData byteData = ByteData.view(buffer);
                  var tempDir = await getTemporaryDirectory();
                  file = await f.File('${tempDir.path}/img').writeAsBytes(
                      buffer.asUint8List(
                          byteData.offsetInBytes, byteData.lengthInBytes));
                }
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<NotesRecord>(
        stream: NotesRecord.getDocument(widget.currentNote!),
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
          final createPointsPageNotesRecord = snapshot.data!;
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
                  await createPointsPageNotesRecord.reference.delete();
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
                    final path = "files/paintedImages/$fileHash";
                    if (uploadedFileUrl != null && uploadedFileUrl != '') {
                      showDialog(
                          context: context,
                          builder: (context) => Center(
                                child: CircularProgressIndicator(
                                    color: Colors.red),
                              ));
                      Size size = Size(backgroundImage!.width.toDouble(),
                          backgroundImage!.height.toDouble());
                      final ui.Image renderedImage =
                          await controller.renderImage(size);
                      final ref = FirebaseStorage.instance.ref().child(path);
                      final Uint8List? byteData = await renderedImage.pngBytes;

                      updTask = ref.putData(byteData!);

                      final snapshot = await updTask!.whenComplete(() {});
                      final urlImg = await snapshot.ref.getDownloadURL();
                      urlNote = urlImg;

                      final notesUpdateData = {
                        ...createNotesRecordData(
                          title: noteTitleController!.text,
                          description: noteDescriptionController!.text,
                          createdBy: currentUserReference,
                          createdAt: getCurrentTimestamp,
                          image: urlImg,
                          isCheckbox: false,
                        ),
                        'note_points': FFAppState().photoNotePoints,
                      };
                      await createPointsPageNotesRecord.reference
                          .update(notesUpdateData);
                      setState(() => FFAppState().photoNotePoints = []);
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
                    setState(() => FFAppState().photoNotePoints = []);

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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 0),
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 0),
                                child: StreamBuilder<List<BulletsRecord>>(
                                  stream: queryBulletsRecord(
                                    parent:
                                        createPointsPageNotesRecord.reference,
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
                                    List<BulletsRecord>
                                        columnBulletsRecordList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnBulletsRecordList.length,
                                          (columnIndex) {
                                        final columnBulletsRecord =
                                            columnBulletsRecordList[
                                                columnIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                        decoration:
                                                            BoxDecoration(
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
                                                        decoration:
                                                            BoxDecoration(
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 0),
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
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
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
                                                  title:
                                                      Text('Добавь параметр'),
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
                                                    createPointsPageNotesRecord
                                                        .reference);
                                            await bulletsRecordReference
                                                .set(bulletsCreateData);
                                            bullet = BulletsRecord
                                                .getDocumentFromData(
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
                            if (uploadedFileUrl != '')
                              FlutterFlowChoiceChips(
                                initiallySelected: ['Комментировать'],
                                options: [
                                  ChipData('Комментировать', Icons.add_comment),
                                  ChipData('Рисовать', FontAwesomeIcons.pen),
                                ],
                                onChanged: (val) => setState(
                                    () => choiceChipsValue = val?.first),
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
                            SizedBox(
                              height: 7,
                            ),
                            if ((createPointsPageNotesRecord != null) &&
                                (uploadedFileUrl != null &&
                                    uploadedFileUrl != '') &&
                                (choiceChipsValue == 'Комментировать'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30, 0, 30, 0),
                                child: Container(
                                  width: backgroundImage!.width.toDouble(),
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: custom_widgets.PhotoNoteWidget(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    image: uploadedFileUrl,
                                    points: createPointsPageNotesRecord
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
                                      setState(() => FFAppState()
                                          .photoNotePoints
                                          .add(createdPoint!.reference));
                                      setState(() => FFAppState().comment = '');
                                      setState(() => FFAppState().dx = 0.0);
                                      setState(() => FFAppState().dy = 0.0);
                                    },
                                  ),
                                ),
                              ),
                            if (backgroundImage != '' &&
                                (choiceChipsValue == 'Рисовать'))
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 60),
                                          // width: backgroundImage!
                                          //         .width *
                                          //     1.5,
                                          // height: backgroundImage!
                                          //         .height *
                                          //     1.5,
                                          child: Center(
                                            child: AspectRatio(
                                              aspectRatio:
                                                  backgroundImage!.width /
                                                      backgroundImage!.height,
                                              child: FlutterPainter(
                                                controller: controller,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            if (uploadedFileUrl == null ||
                                uploadedFileUrl == '')
                              Text(
                                'Пожалуйста добавьте фото,\nНажмите на + внизу',
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
                  if (backgroundImage != null &&
                      (createPointsPageNotesRecord != null) &&
                      uploadedFileUrl != '' &&
                      (choiceChipsValue == 'Рисовать'))
                    Column(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: controller,
                          builder: (context, _, __) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                  maxWidth: 400,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  color: Colors.white54,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (controller.freeStyleMode !=
                                        FreeStyleMode.none) ...[
                                      const Divider(),
                                      const Text("Free Style Settings"),
                                      // Control free style stroke width
                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 1,
                                              child: Text("Stroke Width")),
                                          Expanded(
                                            flex: 3,
                                            child: Slider.adaptive(
                                                min: 2,
                                                max: 25,
                                                value: controller
                                                    .freeStyleStrokeWidth,
                                                onChanged:
                                                    setFreeStyleStrokeWidth),
                                          ),
                                        ],
                                      ),
                                      if (controller.freeStyleMode ==
                                          FreeStyleMode.draw)
                                        Row(
                                          children: [
                                            const Expanded(
                                                flex: 1, child: Text("Color")),
                                            // Control free style color hue
                                            Expanded(
                                              flex: 3,
                                              child: Slider.adaptive(
                                                  min: 0,
                                                  max: 359.99,
                                                  value: HSVColor.fromColor(
                                                          controller
                                                              .freeStyleColor)
                                                      .hue,
                                                  activeColor:
                                                      controller.freeStyleColor,
                                                  onChanged: setFreeStyleColor),
                                            ),
                                          ],
                                        ),
                                    ],
                                    if (controller.shapeFactory != null) ...[
                                      const Divider(),
                                      const Text("Shape Settings"),

                                      // Control text color hue
                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 1,
                                              child: Text("Stroke Width")),
                                          Expanded(
                                            flex: 3,
                                            child: Slider.adaptive(
                                                min: 2,
                                                max: 25,
                                                value: controller.shapePaint
                                                        ?.strokeWidth ??
                                                    shapePaint.strokeWidth,
                                                onChanged: (value) =>
                                                    setShapeFactoryPaint(
                                                        (controller.shapePaint ??
                                                                shapePaint)
                                                            .copyWith(
                                                      strokeWidth: value,
                                                    ))),
                                          ),
                                        ],
                                      ),

                                      // Control shape color hue
                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 1, child: Text("Color")),
                                          Expanded(
                                            flex: 3,
                                            child: Slider.adaptive(
                                                min: 0,
                                                max: 359.99,
                                                value: HSVColor.fromColor(
                                                        (controller.shapePaint ??
                                                                shapePaint)
                                                            .color)
                                                    .hue,
                                                activeColor:
                                                    (controller.shapePaint ??
                                                            shapePaint)
                                                        .color,
                                                onChanged: (hue) =>
                                                    setShapeFactoryPaint(
                                                        (controller.shapePaint ??
                                                                shapePaint)
                                                            .copyWith(
                                                      color: HSVColor.fromAHSV(
                                                              1, hue, 1, 1)
                                                          .toColor(),
                                                    ))),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          const Expanded(
                                              flex: 1,
                                              child: Text("Fill shape")),
                                          Expanded(
                                            flex: 3,
                                            child: Center(
                                              child: Switch(
                                                  value:
                                                      (controller.shapePaint ??
                                                                  shapePaint)
                                                              .style ==
                                                          PaintingStyle.fill,
                                                  onChanged: (value) =>
                                                      setShapeFactoryPaint(
                                                          (controller.shapePaint ??
                                                                  shapePaint)
                                                              .copyWith(
                                                        style: value
                                                            ? PaintingStyle.fill
                                                            : PaintingStyle
                                                                .stroke,
                                                      ))),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: controller,
                          builder: (context, _, __) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Free-style eraser
                              IconButton(
                                icon: Icon(
                                  PhosphorIcons.eraser,
                                  color: controller.freeStyleMode ==
                                          FreeStyleMode.erase
                                      ? Theme.of(context).accentColor
                                      : null,
                                ),
                                onPressed: toggleFreeStyleErase,
                              ),
                              // Free-style drawing
                              IconButton(
                                icon: Icon(
                                  PhosphorIcons.scribbleLoop,
                                  color: controller.freeStyleMode ==
                                          FreeStyleMode.draw
                                      ? Theme.of(context).accentColor
                                      : null,
                                ),
                                onPressed: toggleFreeStyleDraw,
                              ),
                              // Add text

                              // Add sticker image
                              // Add shapes
                              if (controller.shapeFactory == null)
                                PopupMenuButton<ShapeFactory?>(
                                  tooltip: "Add shape",
                                  itemBuilder: (context) =>
                                      <ShapeFactory, String>{
                                    LineFactory(): "Line",
                                    ArrowFactory(): "Arrow",
                                    DoubleArrowFactory(): "Double Arrow",
                                    RectangleFactory(): "Rectangle",
                                    OvalFactory(): "Oval",
                                  }
                                          .entries
                                          .map((e) => PopupMenuItem(
                                              value: e.key,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    getShapeIcon(e.key),
                                                    color: Colors.black,
                                                  ),
                                                  Text(" ${e.value}")
                                                ],
                                              )))
                                          .toList(),
                                  onSelected: selectShape,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      getShapeIcon(controller.shapeFactory),
                                      color: controller.shapeFactory != null
                                          ? Theme.of(context).accentColor
                                          : null,
                                    ),
                                  ),
                                )
                              else
                                IconButton(
                                  icon: Icon(
                                    getShapeIcon(controller.shapeFactory),
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () => selectShape(null),
                                ),
                            ],
                          ),
                        )
                      ],
                    )
                  // else
                  //   Container(
                  //     width: 150,
                  //     height: 150,
                  //   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static IconData getShapeIcon(ShapeFactory? shapeFactory) {
    if (shapeFactory is LineFactory) return PhosphorIcons.lineSegment;
    if (shapeFactory is ArrowFactory) return PhosphorIcons.arrowUpRight;
    if (shapeFactory is DoubleArrowFactory) {
      return PhosphorIcons.arrowsHorizontal;
    }
    if (shapeFactory is RectangleFactory) return PhosphorIcons.rectangle;
    if (shapeFactory is OvalFactory) return PhosphorIcons.circle;
    return PhosphorIcons.polygon;
  }

  void undo() {
    controller.undo();
  }

  void redo() {
    controller.redo();
  }

  void toggleFreeStyleDraw() {
    controller.freeStyleMode = controller.freeStyleMode != FreeStyleMode.draw
        ? FreeStyleMode.draw
        : FreeStyleMode.none;
  }

  void toggleFreeStyleErase() {
    controller.freeStyleMode = controller.freeStyleMode != FreeStyleMode.erase
        ? FreeStyleMode.erase
        : FreeStyleMode.none;
  }

  void setFreeStyleStrokeWidth(double value) {
    controller.freeStyleStrokeWidth = value;
  }

  void setFreeStyleColor(double hue) {
    controller.freeStyleColor = HSVColor.fromAHSV(1, hue, 1, 1).toColor();
  }

  void setShapeFactoryPaint(Paint paint) {
    setState(() {
      controller.shapePaint = paint;
    });
  }

  void selectShape(ShapeFactory? factory) {
    controller.shapeFactory = factory;
  }

  void renderAndDisplayImage() {
    if (backgroundImage == null) return;
    final backgroundImageSize = Size(
        backgroundImage!.width.toDouble(), backgroundImage!.height.toDouble());

    final imageFuture = controller
        .renderImage(backgroundImageSize)
        .then<Uint8List?>((ui.Image image) => image.pngBytes);
    showDialog(
        context: context,
        builder: (context) => RenderedImageDialog(imageFuture: imageFuture));
  }

  void removeSelectedDrawable() {
    final selectedDrawable = controller.selectedObjectDrawable;
    if (selectedDrawable != null) controller.removeDrawable(selectedDrawable);
  }

  void flipSelectedImageDrawable() {
    final imageDrawable = controller.selectedObjectDrawable;
    if (imageDrawable is! ImageDrawable) return;

    controller.replaceDrawable(
        imageDrawable, imageDrawable.copyWith(flipped: !imageDrawable.flipped));
  }
}

class RenderedImageDialog extends StatelessWidget {
  final Future<Uint8List?> imageFuture;

  const RenderedImageDialog({Key? key, required this.imageFuture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Rendered Image"),
      content: FutureBuilder<Uint8List?>(
        future: imageFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SizedBox(
              height: 50,
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const SizedBox();
          }
          return InteractiveViewer(
              maxScale: 10, child: Image.memory(snapshot.data!));
        },
      ),
    );
  }
}
