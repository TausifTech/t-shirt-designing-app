import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart' hide Colors;

class TestPage02 extends StatefulWidget {
  const TestPage02({Key? key}) : super(key: key);

  @override
  _TestPage02State createState() => _TestPage02State();
}

class _TestPage02State extends State<TestPage02> {
  double _scale = 1.0;
  late double _previousScale;
  var yOffset = 150.0;
  var xOffset = 150.0;
  var rotation = 0.0;
  var lastRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: <Widget>[
          stackContainer(),
        ],
      ),
    );
  }

  Widget stackContainer() {

    return Stack(
      children: <Widget>[
        Positioned.fromRect(
          rect: Rect.fromPoints(Offset(xOffset - 250.0, yOffset - 100.0),
              Offset(xOffset + 250.0, yOffset + 100.0)),
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
              child: Image.asset("assets/images/animal1.png",),
            )
            ,
          ),
        ),
      ],
    );
  }
}