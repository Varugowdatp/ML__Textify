import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DocumentScreen extends StatelessWidget {
  final File image;

  DocumentScreen(this.image);

  Future<void> _shareImage(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.shareXFiles(
      [XFile(image.path)],
      text: 'Check out this scanned document!',
      subject: 'Scanned Document',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Document Viewer"),
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => _shareImage(context),
            )
          ]),
      body: Column(
        children: [
          Expanded(
            child: Image.file(image),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Scanned Document Preview",
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
