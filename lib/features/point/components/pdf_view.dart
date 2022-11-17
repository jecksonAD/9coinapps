import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


class PdfViewer extends StatefulWidget {
  final File file;
  final String url;

  const PdfViewer({
    Key? key,
    required this.file,
    required this.url,
  }) : super(key: key);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pdf view", style: TextStyle(color: Colors.white)),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
