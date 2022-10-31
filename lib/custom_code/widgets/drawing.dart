import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/src/widgets/framework.dart';
import '/custom_code/widgets/photo_note_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
//----------------------------Drawing Button----------------------------

bool paintingMode = false;
class DrawingButton extends StatefulWidget {
  const DrawingButton({Key? key}) : super(key: key);
  @override
  _DrawingButtonState createState() => _DrawingButtonState();
}

class _DrawingButtonState extends State<DrawingButton> {
  @override

  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    void onPressed ()
    {
      setState(() {
        paintingMode = !paintingMode;
        print(paintingMode);
      });
      setState(() {
        PhotoNoteWidget;
      });
    }

    return IconButton(
        icon: paintingMode ? Icon(Icons.brush) : Icon(Icons.brush_outlined),
        color: paintingMode ? Colors.blue : Colors.grey,
        splashRadius: 15,
        onPressed: onPressed,
    );
  }
}

class ClearButton extends StatefulWidget {
  const ClearButton({Key? key}) : super(key: key);
  @override
  _ClearButtonState createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  @override
  bool onPressed = false;

  Widget build(BuildContext context) {
    void onPressed ()
    {
      setState(() {
        _DrawingPageState().clear();
      });

    }

    return IconButton(
      icon: Icon(Icons.cancel),
      color: Colors.blue,
      splashRadius: 15,
      onPressed: onPressed,
    );
  }
}
//----------------------------Drawing class-----------------------------------



class DrawingPage extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();

}

class _DrawingPageState extends State<DrawingPage> {
  final formKey = GlobalKey<FormState>();
  List<DrawnLine> lines = <DrawnLine>[];
  DrawnLine line = DrawnLine([], Colors.red, 3);/////////////////////////////////////////////
  Color selectedColor = Colors.red;
  double selectedWidth = 3.0;
  StreamController<List<DrawnLine>> linesStreamController = StreamController<List<DrawnLine>>.broadcast();
  StreamController<DrawnLine> currentLineStreamController = StreamController<DrawnLine>.broadcast();
/*
 Future<void> save() async {

    try {
      RenderRepaintBoundary boundary = formKey.currentContext.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      var saved = await ImageGallerySaver.saveImage(
        pngBytes,
        quality: 100,
        name: DateTime.now().toIso8601String() + ".png",
        isReturnImagePathOfIOS: true,
      );
      print(saved);
    } catch (e) {
      print(e);
    }

  }
 */

  void clear(){
    setState(() {
      lines = [];
        line = DrawnLine([], Colors.red, 0);
    });

  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0),
      body: Stack(
        children: [
          buildAllPaths(context),
          buildCurrentPath(context),
          //buildStrokeToolbar(),
          buildColorToolbar(),
        ],
      ),
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: StreamBuilder<DrawnLine>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: paintingMode ? Sketcher(
                  lines: [line],
                ): null,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: formKey, /////////////////////////////////////
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        padding: EdgeInsets.all(4.0),
        alignment: Alignment.topLeft,
        child: StreamBuilder<List<DrawnLine>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    ) ;
  }

  void onPanStart(DragStartDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);
    line = DrawnLine([point], selectedColor, selectedWidth);
  }

  void onPanUpdate(DragUpdateDetails details) {
    RenderBox box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.path)..add(point);
    if(paintingMode) {
      line = DrawnLine(path, selectedColor, selectedWidth);
      currentLineStreamController.add(line);
    }
  }

  void onPanEnd(DragEndDetails details) {
    if(paintingMode) {
      lines = List.from(lines)
        ..add(line);
      linesStreamController.add(lines);
    }
  }

  /*Widget buildStrokeToolbar() {
    return Positioned(
      bottom: 100.0,
      right: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildStrokeButton(5.0),
          buildStrokeButton(10.0),
          buildStrokeButton(15.0),
        ],
      ),
    );
  } */

  /*Widget buildStrokeButton(double strokeWidth) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedWidth = strokeWidth;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: strokeWidth * 2,
          height: strokeWidth * 2,
          decoration: BoxDecoration(color: selectedColor, borderRadius: BorderRadius.circular(50.0)),
        ),
      ),
    );
  } */

  Widget buildColorToolbar() {
    return Positioned(
      top: 10.0,
      right: 10.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildClearButton(),
          Divider(
            height: 10.0,
          ),

          /*
          buildSaveButton(),
          Divider(
            height: 20.0,
          ),
          buildColorButton(Colors.red),
          buildColorButton(Colors.blueAccent),
          buildColorButton(Colors.deepOrange),
          buildColorButton(Colors.green),
          buildColorButton(Colors.lightBlue),
          buildColorButton(Colors.black),
          buildColorButton(Colors.white), */
        ],
      ),
    );
  }

  /*Widget buildColorButton(Color color) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: FloatingActionButton(
        mini: true,
        backgroundColor: color,
        child: Container(),
        onPressed: () {
          setState(() {
            selectedColor = color;
          });
        },
      ),
    );
  } */

  /*Widget buildSaveButton() {
    return GestureDetector(
      onTap: save,
      child: CircleAvatar(
        child: Icon(
          Icons.save,
          size: 20.0,
          color: Colors.white,
        ),
      ),
    );
  } */

  Widget buildClearButton() {
    return GestureDetector(
      onTap: clear,
      child: Icon(Icons.cancel_outlined, color: Colors.white),
    );
  } //////////////////////////////////////
}

class DrawnLine {
  final List<Offset> path;
  final Color color;
  final double width;

  DrawnLine(this.path, this.color, this.width);
}

class Sketcher extends CustomPainter {
  final List<DrawnLine> lines;

  Sketcher({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; ++i) {
      if (lines[i] == null) continue;
      for (int j = 0; j < lines[i].path.length - 1; ++j) {
        if (lines[i].path[j] != null && lines[i].path[j + 1] != null) {
          paint.color = lines[i].color;
          paint.strokeWidth = lines[i].width;
          canvas.drawLine(lines[i].path[j], lines[i].path[j + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(Sketcher oldDelegate) {
    return true;
  }
}















/*
class Drawing extends StatefulWidget {
  const Drawing({Key? key}) : super(key: key);

  @override
  _DrawingState createState() => _DrawingState();
}

class _DrawingState extends State<Drawing> {
  @override

  GestureDetector build(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: Sketcher(lines: [line]),
          ), // CustomPaint widget will go here
        ),
      ),
    );
  }
}

*/