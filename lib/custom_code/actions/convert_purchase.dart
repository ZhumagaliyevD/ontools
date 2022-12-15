// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'dart:math';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;

Future convertPurchase(
  List<PurchaseRecord> listTools,
  DateTime? dateBefore,
  DateTime? dateAfter,
) async {
  // Add your function code here!
  final pdf = pw.Document();

  int lengthTools = listTools.length;

  final font = await PdfGoogleFonts.nunitoRegular();
  int color = 0xFFE7FFE9;
  //color theme
  double redTheme = 0.231;
  double greenTheme = 0.255;
  double blueTheme = 0.233;

  double pageWidth = 842;
  double pageHeight = 595;

  for (int i = 0; i < lengthTools; i++) {
    pdf.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: PdfPageFormat(pageWidth, pageHeight),
          orientation: pw.PageOrientation.landscape,
          //buildBackground: (context) => pw.SizedBox(width: 842, height: 595, child: pw.Image(pw.ImageImage(pw.))),
          theme: pw.ThemeData(),
        ),
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
            children: [
              pw.Text(listTools[i].toolName!),
              pw.Text(listTools[i].createdAt!.toString()),
            ],
          ),
        ),
      ),
    );
  }

  print('документ сформирован успешно');
  /*
  if (Platform.isAndroid == true)
    output = await getExternalStorageDirectory(); //android
  else
    output = await getApplicationSupportDirectory(); //ios
  print(output.toString());
   */
  // output = await getTemporaryDirectory();
  //var filePath = "${output.path}/YGroup_apartment.pdf";
  //final file = File(filePath);
  //await file.writeAsBytes(await pdf.save());
  //final output = await getTemporaryDirectory();
  //final file = File("${output.path}/YGroup.pdf");
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
    print('документ сохранен успешно');
    //открытие файла
    if (Platform.isAndroid == true)
      await OpenFile.open(
          "/storage/emulated/0/Download/$pdfName.pdf"); //android
    else
      await OpenFile.open("${output.path}/$pdfName.pdf");
  } else
    print('Файл не сохранен');
}
