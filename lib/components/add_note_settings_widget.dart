import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class AddNoteSettingsWidget extends StatefulWidget {
  const AddNoteSettingsWidget({
    Key? key,
    this.object,
    this.obj,
  }) : super(key: key);

  final DocumentReference? object;
  final NotesRecord? obj;

  @override
  _AddNoteSettingsWidgetState createState() => _AddNoteSettingsWidgetState();
}

class _AddNoteSettingsWidgetState extends State<AddNoteSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                      title: widget.obj!.title,
                      description: widget.obj!.description,
                      image: widget.obj!.image,
                      createdBy: currentUserReference,
                      createdAt: getCurrentTimestamp,
                      isCheckbox: widget.obj!.isCheckbox,
                    ),
                    'note_points': widget.obj!.notePoints!.toList(),
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
                    FFLocalizations.of(context).getText(
                      'kczowhhe' /* Создать копию */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
              InkWell(
                onTap: () async {
                  await Share.share(
                      'ontools://ontools.com${GoRouter.of(context).location}');
                  Navigator.pop(context);
                },
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.image,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20,
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'ytlyqod1' /* Поделиться */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
              InkWell(
                onTap: () async {
                  await widget.object!.delete();
                  Navigator.pop(context);

                  context.pushNamed('Notes');
                },
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.pen,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20,
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'xyivg71l' /* Удалить */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
