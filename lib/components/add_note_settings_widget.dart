import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
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
                ListTile(
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
                InkWell(
                  onTap: () async {
                    await bottomSheetMaterialNotesRecord!.reference.delete();
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
              ],
            ),
          ),
        );
      },
    );
  }
}
