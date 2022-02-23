import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class Orders02 extends StatefulWidget {
  const Orders02({Key? key}) : super(key: key);

  @override
  _Orders02State createState() => _Orders02State();
}

class _Orders02State extends State<Orders02> {
  Uint8List? bytes;

  @override
  void initState() {
    super.initState();
    loadImage("image.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildCard(),
          if (bytes != null) Image.memory(bytes!),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final controller = ScreenshotController();
            final bytes = await controller
                .captureFromWidget(Material(child: buildCard()));

            setState(() => this.bytes = bytes);

            saveImage(bytes);
          },
          label: const Text("Capture")),
    );
  }

  Widget buildCard() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(
              "https://media.istockphoto.com/photos/very-closeup-view-of-amazing-domestic-pet-in-mirror-round-fashion-is-picture-id1281804798?b=1&k=20&m=1281804798&s=170667a&w=0&h=HIWbeaP_cQSngCz7l9t3xwyE2eyzVgIy3K6xIqPhJQA=",
              fit: BoxFit.cover,
            ),
          ),
          // ignore: prefer_const_constructors
          Text(
            "Amar naam tausif",
            style: const TextStyle(fontFamily: "Botera", fontSize: 20),
          )
        ],
      );

  Future saveImage(Uint8List bytes) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/image.png');
    file.writeAsBytes(bytes);
  }

  Future loadImage(String A) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/A');
    if (file.existsSync()) {
      final bytes = await file.readAsBytes();

      setState(() => this.bytes = bytes);
    }
  }
}
