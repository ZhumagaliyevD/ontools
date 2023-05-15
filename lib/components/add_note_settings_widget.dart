import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'add_note_settings_model.dart';
export 'add_note_settings_model.dart';

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
  late AddNoteSettingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNoteSettingsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
                    size: 20.0,
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'kczowhhe' /* Создать копию */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Share.share(
                      'ontools://ontools.com${GoRouter.of(context).location}',
                      sharePositionOrigin: getWidgetBoundingBox(context),
                    );
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: FaIcon(
                      FontAwesomeIcons.image,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    title: Text(
                      FFLocalizations.of(context).getText(
                        'ytlyqod1' /* Поделиться */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await widget.object!.delete();
                  Navigator.pop(context);

                  context.pushNamed('Notes');
                },
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.pen,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'xyivg71l' /* Удалить */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
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
