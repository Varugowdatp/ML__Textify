import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'DocumentScreen.dart';
import 'EnhanceScreen.dart';
import 'RecognizerScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  late ImagePicker imagePicker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 55, bottom: 15, left: 5, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: Colors.blueAccent,
              child: Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.scanner,
                            size: 25,
                            color: Colors.white,
                          ),
                          Text(
                            "Scan Here",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        showCupertinoDialog(
                          context: context,
                          builder: (_) => Center(
                              child: CupertinoActivityIndicator(radius: 20)),
                        );

                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        Navigator.pop(context); // remove loader

                        if (xfile != null) {
                          File image = File(xfile.path);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DocumentScreen(image)));
                        }
                      },
                    ),
                    InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.document_scanner,
                            size: 25,
                            color: Colors.white,
                          ),
                          Text(
                            "Recognize",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      onTap: () async {
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        if (xfile != null) {
                          File image = File(xfile.path);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return Recognizerscreen(image);
                          }));
                        }
                      },
                    ),
                    InkWell(
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.assignment_sharp,
                            size: 25,
                            color: Colors.white,
                          ),
                          const Text(
                            "Enhance",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      onTap: () async {
                        showCupertinoDialog(
                          context: context,
                          builder: (_) => const Center(
                              child:
                                  const CupertinoActivityIndicator(radius: 20)),
                        );

                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        Navigator.pop(context); // remove loader

                        if (xfile != null) {
                          File image = File(xfile.path);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EnhanceScreen(image)));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Container(
                height: MediaQuery.of(context).size.height - 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Scan and Recognise",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                    ),
                    const Text("-- You can Recognise the text of your image "),
                    const Text("-- You can enhance your image"),
                    const Text(
                        "-- You can use it for export the recognised text to document"),
                    const Text(
                        "-- You can copy the recognised text to clipboard")
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.blueAccent,
              child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.rotate_left,
                        size: 35,
                        color: Colors.white,
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        if (xfile != null) {
                          File image = File(xfile.path);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return Recognizerscreen(image);
                          }));
                        }
                      },
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.image,
                        size: 35,
                        color: Colors.white,
                      ),
                      onTap: () async {
                        XFile? xfile = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        if (xfile != null) {
                          File image = File(xfile.path);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (ctx) {
                            return Recognizerscreen(image);
                          }));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
