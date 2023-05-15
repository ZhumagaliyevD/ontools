import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'photo_note_component_model.dart';
export 'photo_note_component_model.dart';

class PhotoNoteComponentWidget extends StatefulWidget {
  const PhotoNoteComponentWidget({
    Key? key,
    this.width,
    this.height,
    this.image,
    this.photoNotes,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? image;
  final DocumentReference? photoNotes;

  @override
  _PhotoNoteComponentWidgetState createState() =>
      _PhotoNoteComponentWidgetState();
}

class _PhotoNoteComponentWidgetState extends State<PhotoNoteComponentWidget> {
  late PhotoNoteComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhotoNoteComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Image.network(
            'https://picsum.photos/seed/829/600',
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 1.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
      ],
    );
  }
}
