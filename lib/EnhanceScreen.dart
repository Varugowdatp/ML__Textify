import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class EnhanceScreen extends StatefulWidget {
  final File image;

  EnhanceScreen(this.image);

  @override
  State<EnhanceScreen> createState() => _EnhanceScreenState();
}

class _EnhanceScreenState extends State<EnhanceScreen> {
  double brightness = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enhance Image"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ColorFiltered(
              colorFilter: ColorFilter.matrix(<double>[
                1,
                0,
                0,
                0,
                brightness * 255,
                0,
                1,
                0,
                0,
                brightness * 255,
                0,
                0,
                1,
                0,
                brightness * 255,
                0,
                0,
                0,
                1,
                0,
              ]),
              child: Image.file(widget.image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("Brightness"),
                Slider(
                  value: brightness,
                  min: -1.0,
                  max: 1.0,
                  onChanged: (val) {
                    setState(() {
                      brightness = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
