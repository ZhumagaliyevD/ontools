import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';

import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:math';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;

Future<String> convert(
  List<ToolsRecord> listTools,
  DateTime? dateBefore,
  DateTime? dateAfter,
) async {
  // Add your function code here!

  final pdf = pw.Document();

  final img1 = await networkImage(listTools[0].chequeIMG!);
  var img2;
  var img3;

  final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

  final iame = Image(image: AssetImage("assets/images/favicon.png"));

  final image = await imageFromAssetBundle('assets/images/favicon.png');

  List<Image> listImg = [];

  int lengthTools = listTools.length;
  DateTime bookingDate = DateTime.now();
  String bookDateM = bookingDate.toString();
  var ab = bookDateM.split('.');
  String res = ab[0];

  String b = dateBefore!.year.toString() +
      "-" +
      dateBefore!.month.toString() +
      "-" +
      dateBefore!.day.toString();

  String c = dateAfter!.year.toString() +
      "-" +
      dateAfter!.month.toString() +
      "-" +
      dateAfter!.day.toString();

  final font = await PdfGoogleFonts.nunitoRegular();
  int color = 0xFFE7FFE9;
  //color theme
  double redTheme = 0.231;
  double greenTheme = 0.255;
  double blueTheme = 0.233;

  double pageWidth = 842;
  double pageHeight = 595;

  double totalSum = 0;

  for (int a = 0; a < lengthTools; a++) {
    totalSum = totalSum + listTools[a].price!;
  }

  for (int a = 0; a < lengthTools; a++) {
    // img2 = networkImage(listTools[a].chequeIMG!);
    // listImg.add(img2);
  }

  for (int i = 0; i < lengthTools; i++) {
    var imageI;
    int j = i + 1;
    try {
      imageI = await networkImage(listTools[i].chequeIMG!);
    } catch (e) {}
    if (i == 0) {
      pdf.addPage(
        pw.Page(
          pageTheme: pw.PageTheme(
            pageFormat: PdfPageFormat(pageWidth, pageHeight),
            orientation: pw.PageOrientation.landscape,
            //buildBackground: (context) => pw.SizedBox(width: 842, height: 595, child: pw.Image(pw.ImageImage(pw.))),
            theme: pw.ThemeData(),
          ),
          build: (pw.Context context) => pw.Column(
            children: [
              pw.SizedBox(height: 10),
              pw.Text("OnTools report from " + res,
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 20)),
              pw.SizedBox(height: 7),
              pw.Text("Data range from " + b + " to " + c,
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 20)),
              pw.SizedBox(height: 20),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(horizontal: 20),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Tool Name: "),
                            pw.Text(listTools[i].toolName!)
                          ])),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Tool Price: "),
                            pw.Text(listTools[i].price.toString()!)
                          ])),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Date: "),
                            pw.Text(listTools[i].createdAt.toString()!)
                          ])),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Cheque: "),
                            pw.Image(
                              imageI,
                              height: 280,
                              width: 280,
                            ),
                          ])),
                    ),
                    pw.SizedBox(height: 25),
                    // if (j != 0)
                    //   pw.Column(children: [
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Name: "),
                    //               pw.Text(listTools[j].toolName!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Price: "),
                    //               pw.Text(listTools[j].price.toString()!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Date: "),
                    //               pw.Text(listTools[j].createdAt.toString()!)
                    //             ]))),
                    //     pw.Image(
                    //       imageJ,
                    //       height: 100,
                    //       width: 100,
                    //     ),
                    //     pw.SizedBox(height: 25),
                    //   ]),
                    // if (k != 0)
                    //   pw.Column(children: [
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Name: "),
                    //               pw.Text(listTools[k].toolName!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Price: "),
                    //               pw.Text(listTools[k].price.toString()!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Date: "),
                    //               pw.Text(listTools[k].createdAt.toString()!)
                    //             ]))),
                    //     pw.SizedBox(height: 25),
                    //   ]),
                    if (i + 1 == lengthTools)
                      pw.Column(
                        children: [
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Row(children: [
                            pw.Text(
                              "Total Amount: ",
                              style: pw.TextStyle(
                                fontSize: 15,
                                //fontWeight: pw.FontWeight.bold
                              ),
                            ),
                            pw.Text(
                              totalSum.toString(),
                              style: pw.TextStyle(
                                  fontSize: 15, fontWeight: pw.FontWeight.bold),
                            ),
                          ])
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else
      pdf.addPage(
        pw.Page(
          pageTheme: pw.PageTheme(
            pageFormat: PdfPageFormat(pageWidth, pageHeight),
            orientation: pw.PageOrientation.landscape,
            //buildBackground: (context) => pw.SizedBox(width: 842, height: 595, child: pw.Image(pw.ImageImage(pw.))),
            theme: pw.ThemeData(),
          ),
          build: (pw.Context context) => pw.Column(
            children: [
              pw.SizedBox(height: 30),
              pw.Text("OnTools report page #" + j.toString(),
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 20)),
              pw.SizedBox(height: 7),
              pw.Text("Data range from " + b + " to " + c,
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold, fontSize: 20)),
              pw.SizedBox(height: 10),
              pw.Container(
                margin: pw.EdgeInsets.symmetric(horizontal: 20),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Tool Name: "),
                            pw.Text(listTools[i].toolName!)
                          ])),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Tool Price: "),
                            pw.Text(listTools[i].price.toString()!)
                          ])),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Date: "),
                            pw.Text(listTools[i].createdAt.toString()!)
                          ])),
                    ),
                    pw.Container(
                      decoration: pw.BoxDecoration(
                          border: pw.Border.all(color: PdfColors.black)),
                      child: pw.Padding(
                          padding: pw.EdgeInsets.all(8),
                          child: pw.Row(children: [
                            pw.Text("Cheque: "),
                            pw.Image(
                              imageI,
                              height: 280,
                              width: 280,
                            ),
                          ])),
                    ),
                    pw.SizedBox(height: 25),
                    // if (j != 0)
                    //   pw.Column(children: [
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Name: "),
                    //               pw.Text(listTools[j].toolName!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Price: "),
                    //               pw.Text(listTools[j].price.toString()!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Date: "),
                    //               pw.Text(listTools[j].createdAt.toString()!)
                    //             ]))),
                    //     pw.Image(
                    //       imageJ,
                    //       height: 100,
                    //       width: 100,
                    //     ),
                    //     pw.SizedBox(height: 25),
                    //   ]),
                    // if (k != 0)
                    //   pw.Column(children: [
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Name: "),
                    //               pw.Text(listTools[k].toolName!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Tool Price: "),
                    //               pw.Text(listTools[k].price.toString()!)
                    //             ]))),
                    //     pw.Container(
                    //         decoration: pw.BoxDecoration(
                    //             border: pw.Border.all(color: PdfColors.black)),
                    //         child: pw.Padding(
                    //             padding: pw.EdgeInsets.all(8),
                    //             child: pw.Row(children: [
                    //               pw.Text("Date: "),
                    //               pw.Text(listTools[k].createdAt.toString()!)
                    //             ]))),
                    //     pw.SizedBox(height: 25),
                    //   ]),
                    if (i + 1 == lengthTools)
                      pw.Column(
                        children: [
                          pw.SizedBox(
                            height: 5,
                          ),
                          pw.Row(children: [
                            pw.Text(
                              "Total Amount: ",
                              style: pw.TextStyle(
                                fontSize: 15,
                                //fontWeight: pw.FontWeight.bold
                              ),
                            ),
                            pw.Text(
                              totalSum.toString(),
                              style: pw.TextStyle(
                                  fontSize: 15, fontWeight: pw.FontWeight.bold),
                            ),
                          ])
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }

  pw.Page(
    pageTheme: pw.PageTheme(
      pageFormat: PdfPageFormat(pageWidth, pageHeight),
      orientation: pw.PageOrientation.portrait,
      //buildBackground: (context) => pw.SizedBox(width: 842, height: 595, child: pw.Image(pw.ImageImage(pw.))),
      theme: pw.ThemeData(),
    ),
    build: (pw.Context context) => pw.Center(
      child: pw.Container(
          decoration:
              pw.BoxDecoration(border: pw.Border.all(color: PdfColors.black)),
          child: pw.Row(children: [
            pw.Text("Tool Name: "),
            pw.Text(totalSum.toString())
          ])),
    ),
  );

  print('документ сформирован успешно');
  var file;
  var output;

  Map<Permission, PermissionStatus> statuses = await [
    Permission.storage,
  ].request();
  if (statuses[Permission.storage]!.isGranted) {
    print('Доступ к экспорту пдф разрешен');
    String pdfName = 'OnTools_${Random().nextInt(1000)}';
    if (Platform.isAndroid == true)
      output = await getExternalStorageDirectory(); //android
    else
      output = await getApplicationDocumentsDirectory(); //ios
    //print(output.toString());
    if (Platform.isAndroid == true)
      //file = File("${output.path}/YGroup_${post.zhkName}.pdf"); //android
      file = File("/storage/emulated/0/Download/$pdfName.pdf");
    else
      file = File("${output.path}/$pdfName.pdf"); //ios
    //print(output.toString());
    await file.writeAsBytes(await pdf.save());
    //await file.readAsBytes();
    print('документ сохранен успешно');
    //открытие файла
    if (Platform.isAndroid == true)
      await OpenFile.open(
          "/storage/emulated/0/Download/$pdfName.pdf"); //android
    else
      await OpenFile.open("${output.path}/$pdfName.pdf");
    Random random = new Random();
    int fileHash = random.nextInt(54) * random.nextInt(23);
    final path = "files/paintedImages/$fileHash";
    final ref = FirebaseStorage.instance.ref().child(path);
    //final Uint8List? byteData = await ;
    UploadTask? updTask;

    updTask = ref.putData(file.readAsBytesSync()!);

    final snapshot = await updTask!.whenComplete(() {});
    final pdfLink = await snapshot.ref.getDownloadURL();

    return "${output.path}/$pdfName.pdf";
  } else {
    print('Файл не сохранен');
    return "blablabla";
  }
}
