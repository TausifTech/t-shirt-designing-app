import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Uint8List? bytes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Saved Layouts"),),
      body: Padding(
        child: Column(
          children: [
            if (bytes != null) Image.memory(bytes!),
            Spacer(),
            Container(
              height: 200,
              width: 200,
              color: Colors.white,
              child: Center(child: Text("Sponsor", style: TextStyle(fontFamily: "Nisebuschgardens", color: Colors.black38, fontSize: 20),),),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15,
              ),
              child: const Text(
                  'Product of TausifTech || Built on Flutter || Android Target SDK 30 || All Rights Reserved\n',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  )),
            )
          ],
        ),
        padding: const EdgeInsets.all(16),)
    );
  }

  Future loadImage() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/image.png');
    if (file.existsSync()) {
      final bytes = await file.readAsBytes();

      setState(() => this.bytes = bytes);
    }
  }
}
