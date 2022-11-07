import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  _NotesWidgetState createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  TextEditingController? searchController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            FFIcons.kplus,
            color: Color(0xFFF1F2F5),
            size: 24,
          ),
          onPressed: () async {
            context.pushNamed('createPointsPage');

            final notesCreateData = createNotesRecordData(
              createdAt: getCurrentTimestamp,
              createdBy: currentUserReference,
            );
            await NotesRecord.collection.doc().set(notesCreateData);
            setState(() => FFAppState().isCheckbox = false);
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Заметки',
          style: FlutterFlowTheme.of(context).subtitle1,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: searchController,
                              onChanged: (_) => EasyDebounce.debounce(
                                'searchController',
                                Duration(milliseconds: 500),
                                () => setState(() {}),
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Поиск',
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
                                fillColor:
                                    FlutterFlowTheme.of(context).lineColor,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.close,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 20,
                            ),
                            onPressed: () async {
                              setState(() {
                                searchController?.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: StreamBuilder<List<NotesRecord>>(
                    stream: queryNotesRecord(
                      queryBuilder: (notesRecord) => notesRecord
                          .where('created_by', isEqualTo: currentUserReference),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          ),
                        );
                      }
                      List<NotesRecord> searchNoteListNotesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: searchNoteListNotesRecordList.length,
                        itemBuilder: (context, searchNoteListIndex) {
                          final searchNoteListNotesRecord =
                              searchNoteListNotesRecordList[
                                  searchNoteListIndex];
                          return Visibility(
                            visible: functions.searchRealTimeCopy(
                                searchController!.text,
                                searchNoteListNotesRecord.title!),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'PointsPage',
                                    queryParams: {
                                      'notepage': serializeParam(
                                        searchNoteListNotesRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'notepage': searchNoteListNotesRecord,
                                    },
                                  );
                                },
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Text(
                                            searchNoteListNotesRecord.title!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Image.network(
                                            searchNoteListNotesRecord.image!,
                                            width: double.infinity,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          searchNoteListNotesRecord.description!
                                              .maybeHandleOverflow(
                                            maxChars: 35,
                                            replacement: '…',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                        if (searchNoteListNotesRecord != null)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: StreamBuilder<
                                                    List<BulletsRecord>>(
                                                  stream: queryBulletsRecord(
                                                    parent:
                                                        searchNoteListNotesRecord
                                                            .reference,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50,
                                                          height: 50,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryColor,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<BulletsRecord>
                                                        columnBulletsRecordList =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnBulletsRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnBulletsRecord =
                                                            columnBulletsRecordList[
                                                                columnIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 12),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  if (columnBulletsRecord
                                                                          .isDone ==
                                                                      false)
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        final bulletsUpdateData =
                                                                            createBulletsRecordData(
                                                                          isDone:
                                                                              true,
                                                                        );
                                                                        await columnBulletsRecord
                                                                            .reference
                                                                            .update(bulletsUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (columnBulletsRecord
                                                                          .isDone ==
                                                                      true)
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        final bulletsUpdateData =
                                                                            createBulletsRecordData(
                                                                          isDone:
                                                                              false,
                                                                        );
                                                                        await columnBulletsRecord
                                                                            .reference
                                                                            .update(bulletsUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            40,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(12),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  columnBulletsRecord
                                                                      .text!,
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
                                            ],
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              dateTimeFormat(
                                                  'd/M/y',
                                                  searchNoteListNotesRecord
                                                      .createdAt!),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
