import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:torofy_demo01/data/data.dart';
import 'package:torofy_demo01/data/utils.dart';
import 'package:torofy_demo01/data/widget/draggable_widget.dart';
import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class DraggableAdvancedPage extends StatefulWidget {
  const DraggableAdvancedPage({Key? key}) : super(key: key);

  @override
  _DraggableAdvancedPageState createState() => _DraggableAdvancedPageState();
}

class _DraggableAdvancedPageState extends State<DraggableAdvancedPage> {
  Uint8List? bytes;
  final controller = ScreenshotController();

  final List<Animal> all = allAnimals;
  final List<Animal> land = landAnimals;
  final List<Animal> air = birdAnimals;
  final List<Animal> fire = [];
  final List<Animal> ice = [];

  final List<Animal> a = aAnimals;
  final List<Animal> b = bAnimals;
  final List<Animal> c = cAnimals;

  final double size = 150;

  void removeAll(Animal toRemove) {
    all.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    land.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    air.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    fire.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    ice.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);

    a.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    b.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
    c.removeWhere((animal) => animal.imageUrl == toRemove.imageUrl);
  }

  bool thema = false;

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 315, right: 125),
        child: FloatingActionButton.extended(
            backgroundColor: thema ? Colors.black : Colors.white,
            onPressed: () {
              if (thema == false) {
                setState(() {
                  thema = true;
                });
              } else {
                setState(() {
                  thema = false;
                });
              }
            },
            label: thema
                ? const Text("Black Shirt",
                    style: TextStyle(
                        fontFamily: "Nisebuschgardens",
                        fontWeight: FontWeight.w600,
                        color: Colors.white54))
                : const Text("White Shirt",
                    style: TextStyle(
                        fontFamily: "Nisebuschgardens",
                        fontWeight: FontWeight.w600,
                        color: Colors.black54))),
      ),
      appBar: AppBar(
        title: const Text("Torofy"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.dstATop))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        Flushbar(
                          title: "Easy Bro!",
                          boxShadows: [
                            BoxShadow(
                              color: Colors.blue,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 3.0,
                            )
                          ],
                          message:
                              "The lines drawn on shirt are for scaling and they will not be printed\n"
                              "Drag your desired sticker on the <T-Shirt>\n"
                              "Shufle stickers by dragging them to <Keep>",
                          duration: Duration(seconds: 5),
                        )..show(context);
                      },
                      icon: Icon(Icons.info),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          textStyle: TextStyle(
                              fontFamily: "Botera",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      label: Text(
                        "Help",
                        style: TextStyle(color: Colors.white),
                      )),
                  ElevatedButton.icon(
                      onPressed: () async {
                        final bytes = await controller.capture();

                        setState(() => this.bytes = bytes);

                        saveImage(bytes!);

                        Flushbar(
                          title: "SAVED!",
                          boxShadows: [
                            BoxShadow(
                              color: Colors.blue,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 3.0,
                            )
                          ],
                          message: "Your work has been saved.\nCheck Saved Layouts",
                          duration: Duration(seconds: 4),
                        )..show(context);
                      },
                      icon: Icon(
                        Icons.done_all_rounded,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          textStyle: TextStyle(
                              fontFamily: "Botera",
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      label: Text(
                        "Done",
                        style: TextStyle(color: Colors.grey[900]),
                      )),
                ],
              ),
              Screenshot(
                  child: Material(
                      color: thema ? Colors.white54 : Colors.black38,
                      child: buildTarget2(
                        context,
                        text: 'Testing',
                        animals: fire,
                        acceptTypes: [AnimalType.fire],
                        onAccept: (data) => setState(() {
                          removeAll(data);
                          fire.add(data);
                        }),
                      )),
                  controller: controller),
              const Spacer(),
              Wrap(
                spacing: 10,
                runSpacing: 20,
                children: <Widget>[
                  buildTarget(
                    context,
                    text: 'Nature',
                    animals: all,
                    acceptTypes: AnimalType.values,
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      all.add(data);
                    }),
                  ),
                  buildTarget(
                    context,
                    text: 'Keep',
                    animals: ice,
                    acceptTypes: [AnimalType.ice],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      ice.add(data);
                    }),
                  ),
                  buildTarget(
                    context,
                    text: 'Games',
                    animals: a,
                    acceptTypes: [AnimalType.a],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      a.add(data);
                    }),
                  ),
                  buildTarget(
                    context,
                    text: 'DBZ',
                    animals: b,
                    acceptTypes: [AnimalType.b],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      b.add(data);
                    }),
                  ),
                  buildTarget(
                    context,
                    text: 'Tigers',
                    animals: c,
                    acceptTypes: [AnimalType.c],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      c.add(data);
                    }),
                  ),
                  buildTarget(
                    context,
                    text: 'Birds',
                    animals: air,
                    acceptTypes: [AnimalType.air],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      air.add(data);
                    }),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ));

  //testing widgets bellow
  Widget buildTarget2(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) =>
      DragTarget<Animal>(
        builder: (context, candidateData, rejectedData) => ClipPath(
          clipper: MyClipper2(),
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: thema ? AssetImage('assets/images/shirt03.png') : AssetImage('assets/images/shirt02.png'),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                ...animals
                    .map((animal) => DraggableWidget3(
                        animal: animal)) //positioned widget here
                    .toList(),
              ],
            ),
          ),
        ),
        onWillAccept: (data) => true,
        onAccept: (data) {
          if (acceptTypes.contains(data.type)) {
            Utils.showSnackBar(
              context,
              text: 'This looks nice',
              color: Colors.white24,
            );
          } else {
            Utils.showSnackBar(
              context,
              text: 'Wow',
              color: Colors.black26,
            );
          }

          onAccept(data);
        },
      );

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) =>
      CircleAvatar(
        radius: 48,
        child: DragTarget<Animal>(
          builder: (context, candidateData, rejectedData) => Stack(
            children: [
              ...animals
                  .map((animal) => DraggableWidget(animal: animal))
                  .toList(),
              IgnorePointer(child: Center(child: buildText(text))),
            ],
          ),
          onWillAccept: (data) => true,
          onAccept: (data) {
            if (acceptTypes.contains(data.type)) {
              Utils.showSnackBar(
                context,
                text: 'This looks nice',
                color: Colors.white24,
              );
            } else {
              Utils.showSnackBar(
                context,
                text: 'Wow',
                color: Colors.black26,
              );
            }
            onAccept(data);
          },
        ),
      );

  Widget buildText(String text) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 12,
          )
        ]),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Future saveImage(Uint8List bytes) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/image.png');
    file.writeAsBytes(bytes);
  }
}
