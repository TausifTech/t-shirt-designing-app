import 'package:torofy_demo01/data/data.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' hide Colors;


class DraggableWidget extends StatelessWidget {
  final Animal animal;

  const DraggableWidget({
    Key? key,
    required this.animal,
  }) : super(key: key);

  static double size = 150;



  @override
  Widget build(BuildContext context) => Draggable<Animal>(
        data: animal,
        feedback: buildImage(),
        child: buildImage(),
        childWhenDragging: Container(height: size),
      );

  Widget buildImage() => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Image.asset(animal.imageUrl),
      );

//widget below
//is
//being tested

}

class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0475000, size.height * 0.3625000);
    path0.cubicTo(
        size.width * 0.0995000,
        size.height * 0.2918750,
        size.width * 0.1763250,
        size.height * 0.1013500,
        size.width * 0.2225000,
        size.height * 0.1050000);
    path0.cubicTo(
        size.width * 0.2897000,
        size.height * 0.0934500,
        size.width * 0.3537500,
        size.height * 0.0525000,
        size.width * 0.3975000,
        size.height * 0.0350000);
    path0.cubicTo(
        size.width * 0.4521000,
        size.height * 0.0394000,
        size.width * 0.5341750,
        size.height * 0.0393750,
        size.width * 0.5891750,
        size.height * 0.0350000);
    path0.cubicTo(
        size.width * 0.6323000,
        size.height * 0.0506250,
        size.width * 0.6856250,
        size.height * 0.0928250,
        size.width * 0.7550000,
        size.height * 0.1050000);
    path0.cubicTo(
        size.width * 0.8100000,
        size.height * 0.1034500,
        size.width * 0.8900000,
        size.height * 0.3000000,
        size.width * 0.9350000,
        size.height * 0.3650000);
    path0.cubicTo(
        size.width * 0.8348750,
        size.height * 0.4190000,
        size.width * 0.8300000,
        size.height * 0.4212500,
        size.width * 0.7950000,
        size.height * 0.4400000);
    path0.cubicTo(
        size.width * 0.7825500,
        size.height * 0.4120500,
        size.width * 0.7506500,
        size.height * 0.4026750,
        size.width * 0.7300000,
        size.height * 0.3550000);
    path0.cubicTo(
        size.width * 0.7168250,
        size.height * 0.4023000,
        size.width * 0.7262500,
        size.height * 0.8937500,
        size.width * 0.7300000,
        size.height * 0.9500000);
    path0.cubicTo(
        size.width * 0.7305500,
        size.height * 0.9876000,
        size.width * 0.2573500,
        size.height * 0.9905250,
        size.width * 0.2575000,
        size.height * 0.9500000);
    path0.cubicTo(
        size.width * 0.2566750,
        size.height * 0.9005250,
        size.width * 0.2701250,
        size.height * 0.3974750,
        size.width * 0.2537500,
        size.height * 0.3575000);
    path0.cubicTo(
        size.width * 0.2262000,
        size.height * 0.3986000,
        size.width * 0.1997250,
        size.height * 0.4140000,
        size.width * 0.1875000,
        size.height * 0.4425000);
    path0.cubicTo(
        size.width * 0.1525000,
        size.height * 0.4225000,
        size.width * 0.1525000,
        size.height * 0.4225000,
        size.width * 0.0475000,
        size.height * 0.3625000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class DraggableWidget3 extends StatefulWidget {
  final Animal animal;

  const DraggableWidget3({Key? key,
  required this.animal
  }) : super(key: key);

  @override
  _DraggableWidget3State createState() => _DraggableWidget3State();
}

class _DraggableWidget3State extends State<DraggableWidget3> {
  double _scale = 1.0;
  late double _previousScale;
  var yOffset = 200.0;
  var xOffset = 200.0;
  var rotation = 0.0;
  var lastRotation = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
        children: <Widget>[
    Positioned.fromRect(
      rect: Rect.fromPoints(Offset(xOffset - 140.0, yOffset - 200.0),
          Offset(xOffset +50, yOffset -10)),
      child: GestureDetector(
        onScaleStart: (scaleDetails) {
          _previousScale = _scale;
          print(' scaleStarts = ${scaleDetails.focalPoint}');
        },
        onScaleUpdate: (scaleUpdates) {

          lastRotation += scaleUpdates.rotation;
          var offset = scaleUpdates.focalPoint;
          xOffset = offset.dx;
          yOffset = offset.dy;

          setState(() => _scale = _previousScale * scaleUpdates.scale);
        },
        onScaleEnd: (scaleEndDetails) {
          _previousScale = 0;
          print(' scaleEnds = ${scaleEndDetails.velocity}');
        },
        child:
        Transform(
          transform: Matrix4.diagonal3( Vector3(_scale, _scale, _scale))..rotateZ(rotation * math.pi/180.0),
          alignment: FractionalOffset.center,
          child: Image.asset(widget.animal.imageUrl),
        )
      ),
    )],
    );
  }
}
