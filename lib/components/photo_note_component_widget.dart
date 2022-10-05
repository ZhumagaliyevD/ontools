import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Image.network(
            'https://picsum.photos/seed/829/600',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
        ),
      ],
    );
  }
}
