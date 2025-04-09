import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';

class Recognizerscreen extends StatefulWidget {
  final File image;
  Recognizerscreen(this.image);

  @override
  State<Recognizerscreen> createState() => _RecognizerscreenState();
}

class _RecognizerscreenState extends State<Recognizerscreen> {
  late TextRecognizer textRecognizer;
  String results = " ";
  String? pdfFilePath;
  String? textFilePath;

  @override
  void initState() {
    super.initState();
    textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    doTextRecognition();
  }

  Future<void> doTextRecognition() async {
    InputImage inputImage = InputImage.fromFile(widget.image);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    setState(() {
      results = recognizedText.text;
    });
  }

  void copyToClipboard() {
    Clipboard.setData(ClipboardData(text: results));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Text copied to clipboard')));
  }

  Future<void> exportToPDF(String content) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(content, style: pw.TextStyle(fontSize: 18)),
        ); // Text content
      },
    ));

    final outputDir = await getTemporaryDirectory();
    final file = File("${outputDir.path}/recognized_text.pdf");
    await file.writeAsBytes(await pdf.save());

    setState(() {
      pdfFilePath = file.path;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("PDF document saved!")));
  }

  Future<void> exportToTextFile(String content) async {
    final outputDir = await getTemporaryDirectory();
    final file = File("${outputDir.path}/recognized_text.txt");
    await file.writeAsString(content);

    setState(() {
      textFilePath = file.path;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Text document saved!")));
  }

  void sharePDF() {
    if (pdfFilePath != null && File(pdfFilePath!).existsSync()) {
      Share.shareXFiles([XFile(pdfFilePath!)],
          text: 'Here is the extracted document');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please export the document first.")));
    }
  }

  void shareTextFile() {
    if (textFilePath != null && File(textFilePath!).existsSync()) {
      Share.shareXFiles([XFile(textFilePath!)],
          text: 'Here is the extracted text document');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please export the document first.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Recognition"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.file(widget.image),
            Card(
              margin: EdgeInsets.all(10),
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Container(
                    color: Colors.blueAccent,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.document_scanner, color: Colors.white),
                        Text("Results",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        InkWell(
                          child: Icon(Icons.copy, color: Colors.white),
                          onTap: copyToClipboard,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      results,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => exportToPDF(results),
              icon: Icon(Icons.picture_as_pdf),
              label: Text("Export to PDF"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => exportToTextFile(results),
              icon: Icon(Icons.text_fields),
              label: Text("Export to Text File"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: sharePDF,
              icon: Icon(Icons.share),
              label: Text("Share PDF Document"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: shareTextFile,
              icon: Icon(Icons.share),
              label: Text("Share Text Document"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
