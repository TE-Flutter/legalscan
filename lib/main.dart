import 'dart:io' as io;

import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PDFDocument? _scannedDocument;
  io.File? _scannedDocumentFile;
  io.File? _scannedImage;

  openPdfScanner(BuildContext context) async {
    try {
      var doc = await DocumentScannerFlutter.launchForPdf(
        context,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Steps",
          ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_SINGLE: "Only 1 Page",
          ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_MULTIPLE:
              "Only {PAGES_COUNT} Page"
        },
        //source: ScannerFileSource.CAMERA
      );
      if (doc != null) {
        _scannedDocument = null;
        setState(() {});
        await Future.delayed(Duration(milliseconds: 100));
        _scannedDocumentFile = doc;
        _scannedDocument = await PDFDocument.fromFile(doc);
        setState(() {});
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Legal scan'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_scannedDocument != null || _scannedImage != null) ...[
              if (_scannedImage != null)
                Image.file(_scannedImage!,
                    width: 300, height: 300, fit: BoxFit.contain),
              if (_scannedDocument != null)
                Expanded(
                    child: PDFViewer(
                  document: _scannedDocument!,
                )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    _scannedDocumentFile?.path ?? _scannedImage?.path ?? ''),
              ),
            ],
            Center(
              child: Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () => openPdfScanner(context),
                    child: Text("PDF Scan"));
              }),
            )
          ],
        ),
      ),
    );
  }
}
