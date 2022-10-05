import '../backend/backend.dart';
import '../components/img_paint_buttons_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PainterPageWidget extends StatefulWidget {
  const PainterPageWidget({
    Key? key,
    this.noteIMG,
  }) : super(key: key);

  final NotesRecord? noteIMG;

  @override
  _PainterPageWidgetState createState() => _PainterPageWidgetState();
}

class _PainterPageWidgetState extends State<PainterPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Изменено:10:15',
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
            onPressed: () {
              print('IconButton pressed ...');
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              child: custom_widgets.PhotoNoteWidget(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                image: widget.noteIMG!.image!,
                onCreatePhotoNote: () async {},
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ImgPaintButtonsWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
