import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class AddNoteSettingsWidget extends StatefulWidget {
  const AddNoteSettingsWidget({Key? key}) : super(key: key);

  @override
  _AddNoteSettingsWidgetState createState() => _AddNoteSettingsWidgetState();
}

class _AddNoteSettingsWidgetState extends State<AddNoteSettingsWidget> {
  @override
  Widget build(BuildContext context) {
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
        List<NotesRecord> bottomSheetMaterialNotesRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final bottomSheetMaterialNotesRecord =
            bottomSheetMaterialNotesRecordList.isNotEmpty
                ? bottomSheetMaterialNotesRecordList.first
                : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      final notesCreateData = {
                        ...createNotesRecordData(
                          title: bottomSheetMaterialNotesRecord!.title,
                          description:
                              bottomSheetMaterialNotesRecord!.description,
                          isCheckbox:
                              bottomSheetMaterialNotesRecord!.isCheckbox,
                          image: bottomSheetMaterialNotesRecord!.image,
                          createdBy: currentUserReference,
                          createdAt: getCurrentTimestamp,
                        ),
                        'note_points': bottomSheetMaterialNotesRecord!
                            .notePoints!
                            .toList(),
                      };
                      await NotesRecord.collection.doc().set(notesCreateData);
                      Navigator.pop(context);

                      context.pushNamed('Notes');
                    },
                    child: ListTile(
                      leading: Icon(
                        FFIcons.kcamera,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      title: Text(
                        'Создать копию',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                      await Share.share(
                          'ontools://ontools.com${GoRouter.of(context).location}');
                    },
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.image,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      title: Text(
                        'Поделиться',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await bottomSheetMaterialNotesRecord!.reference.delete();
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.pen,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 20,
                      ),
                      title: Text(
                        'Удалить',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      dense: false,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await bottomSheetMaterialNotesRecord!.reference.delete();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: FaIcon(
                              FontAwesomeIcons.pen,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Text(
                              'Удалить',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
