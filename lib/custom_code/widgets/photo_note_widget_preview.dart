// Automatic FlutterFlow imports
import 'package:flutter_painter/flutter_painter.dart';

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'dart:ui' as ui;

typedef VoidCallback = void Function();

class PhotoNote {
  final double x;
  final double y;
  final String description;

  PhotoNote(this.x, this.y, this.description);
}

class PhotoNoteWidgetPreview extends StatefulWidget {
  const PhotoNoteWidgetPreview({
    Key? key,
    this.width,
    this.height,
    required this.image,
    required this.onCreatePhotoNote,
    this.points,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String image;
  final Future<dynamic> Function() onCreatePhotoNote;
  final List<DocumentReference>? points;

  @override
  _PhotoNoteWidgetPreviewState createState() => _PhotoNoteWidgetPreviewState();
}

class _PhotoNoteWidgetPreviewState extends State<PhotoNoteWidgetPreview> {
  List<PhotoNote> photoNotes = [];

  final TextEditingController _textFieldController = TextEditingController();

  double x = 100;
  double y = 100;

  ui.Image? backgroundImage;

  bool showNewPoint = false;

  void addPoint() async {}

  void initBackground() async {
    final image = await NetworkImage(widget.image).image;
    setState(() {
      backgroundImage = image;
    });
  }

  Future getData() async {
    if (widget.points != null) {
      final snapshot = await widget.points![0].get();
      int len = widget.points!.length;

      for (int i = 0; i < len; i++) {
        final snapshot = await widget.points![i].get();
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        photoNotes.add(PhotoNote(data['dx'], data['dy'], data['description']));
      }
      setState(() {});
    }
    setState(() {});
    print(photoNotes.length);
  }

  @override
  void initState() {
    super.initState();
    initBackground();
    getData();
    FFAppState().photoNotePoints.clear();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: backgroundImage?.width.toDouble() ?? 150,
      height: backgroundImage?.height.toDouble() ?? 150,
      child:

          /// Picked Image
          Stack(
        children: <Widget>[
          /// Picked Image
          GestureDetector(
            onTapDown: (details) {
              // showDialog(context: context, builder: (context) {
              //   return AlertDialog(
              //     title: const Text('Type description'),
              //     content: TextField(
              //       onChanged: (value) { },
              //       controller: _textFieldController,
              //       decoration: const InputDecoration(hintText: "Text Field in Dialog"),
              //     ),
              //     actions: [
              //       TextButton(onPressed: () {
              //         photoNotes.add(PhotoNote(details.localPosition.dx, details.localPosition.dy, _textFieldController.text));
              //         _textFieldController.clear();
              //         setState(() {});
              //         Navigator.pop(context);
              //       }, child: const Text("Submit"))
              //     ],
              //   );
              // });
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 0)),
                child: Image.network(widget.image)),
          ),

          Stack(
            children: photoNotes
                .map((e) => Positioned(
                      top: e.y,
                      left: e.x,
                      // right: width - x - 10,
                      // bottom: height - y - 10,
                      child: JustTheTooltip(
                        tailLength: 10.0,
                        backgroundColor: Colors.black,
                        triggerMode: TooltipTriggerMode.tap,
                        preferredDirection: AxisDirection.up,
                        margin: const EdgeInsets.all(20.0),
                        isModal: true,
                        content: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                e.description,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),

          showNewPoint
              ? Positioned(
                  left: x,
                  top: y,
                  child: Stack(
                    children: [
                      const Center(
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ),
                      Align(
                        // alignment: Alignment.topRight,
                        child: AnimatedContainer(
                          width: _textFieldController.text == "" ? 200 : 150,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)),
                          margin: const EdgeInsets.only(left: 30, bottom: 80),
                          duration: const Duration(milliseconds: 100),
                          child: Flex(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            direction: _textFieldController.text == ""
                                ? Axis.horizontal
                                : Axis.vertical,
                            children: [
                              SizedBox(
                                width:
                                    _textFieldController.text == "" ? 110 : 150,
                                child: TextFormField(
                                  controller: _textFieldController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  minLines: 1,
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  decoration: const InputDecoration(
                                    hintText: 'Add a comment',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0)),
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      _textFieldController.text == ""
                                          ? Container()
                                          : Container(
                                              width: 150,
                                              height: 0.5,
                                              color: Colors.white,
                                            ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
