import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:torofy_demo01/main_screens/homepage.dart';

class DataInput extends StatefulWidget {
  final String patientName;
  final String image;
  final dynamic age;

  const DataInput({
    Key? key,
    required this.patientName,
    required this.image,
    required this.age,
  }) : super(key: key);


  @override
  _DataInputState createState() => _DataInputState();
}

class _DataInputState extends State<DataInput> {


  var scaffoldKey = GlobalKey<ScaffoldState>();

  final bpController = TextEditingController();
  final sugarController = TextEditingController();
  final noteController = TextEditingController();
  String dropdownValue = 'Random Test';
  String dropdownValue2 = 'Home Made';

  DateTime? _chosenDateTime = DateTime.now();

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
          height: 500,
          color: Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Container(
                height: 400,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (val) {
                      setState(() {
                        _chosenDateTime = val;
                      });
                    }),
              ),

              // Close the modal
              CupertinoButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String image2 = widget.image;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: width,
              height: height * 0.365,
              child: Image.asset(
                'assets/images/$image2',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: height * 0.365,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xCC000000),
                    const Color(0x00000000),
                    const Color(0x00000000),
                    const Color(0xCC000000),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.245,
            left: width * 0.03,
            child: Text(
              widget.patientName,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 40,
              ),
            ),
          ),
          Positioned(
            top: height * 0.06,
            left: width * 0.05,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: new Icon(Icons.arrow_back_ios),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.68,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 3.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff06868d),
                    Color(0xff01a5a0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                      top: height * 0.02,
                      left: width * 0.1,
                      child: GestureDetector(onTap: () => _showDatePicker(context),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: height * 0.07,
                          width: width * 0.38,
                          child: Center(
                            child: Text(
                              _chosenDateTime.toString().substring(0, 10),
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: height * 0.025,
                                  color: Colors.black),
                            ),
                          ),
                        ),)
                  ),
                  Positioned(
                      top: height * 0.02,
                      right: width * 0.1,
                      child: GestureDetector(
                        onTap: () => _showDatePicker(context),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/back.gif'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          height: height * 0.07,
                          width: width * 0.38,
                          child: Center(
                            child: Text(
                              _chosenDateTime.toString().substring(11, 16),
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: height * 0.03,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      )
                  ),

                  ///////////////              sliders                                /////////////////////////////////////////
                  ///
                  ///
                  Positioned(
                      top: height * 0.055,
                      left: width * 0.05,
                      child: Container(
                          margin: EdgeInsets.all(30),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child:
                          Wrap(direction: Axis.vertical, children: <Widget>[
                            SizedBox(height: 15,),
                            Container(
                              width: width * 0.74,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: const Color(0xff125162),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                underline: Container(
                                  height: 2,
                                  color: const Color(0xff125162),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Random Test',
                                  'Fasting',
                                  '2hr aft Breakfast',
                                  '2hr aft LUNCH',
                                  '2hr aft DINNER'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              width: width * 0.74,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: dropdownValue2,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: const Color(0xff125162),
                                ),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20),
                                underline: Container(
                                  height: 2,
                                  color: const Color(0xff125162),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Home Made',
                                  'Fruits',
                                  'Store Bought',
                                  'Polaw',
                                  'Oily Food'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IntrinsicWidth(
                              stepWidth: width * 0.74,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                keyboardType: TextInputType.number,
                                controller: sugarController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Sugar Level (Ex: 8.0)',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            IntrinsicWidth(
                              stepWidth: width * 0.74,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                keyboardType: TextInputType.number,
                                controller: bpController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText:
                                  'Enter Blood Pressure (Ex: 120/70)',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                              ),
                            ),SizedBox(height: 15),
                            IntrinsicWidth(
                              stepWidth: width * 0.74,
                              child: TextFormField(
                                style: TextStyle(fontSize: 20),
                                controller: noteController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Notes',
                                  labelStyle: TextStyle(color: Colors.white70),
                                  contentPadding: EdgeInsets.all(8),
                                ),
                              ),
                            ),
                          ]))),

///////////////////////////////////
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  ///
                  Positioned(
                    bottom: height * 0.06,
                    left: 0,
                    child: InkResponse(
                      onTap: () {
                        createRecord();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          image: DecorationImage(
                              image: AssetImage('assets/images/team.png'),
                              fit: BoxFit.cover),
                        ),
                        height: height * 0.07,
                        width: width * 0.9,
                        child: Row(children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ADD DATA',
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: height * 0.03,
                                color: Colors.black),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void createRecord() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    if (user != null) {
      final uid = user.uid;

      final dynamic x = sugarController.text;
      final dynamic y = bpController.text;
      final dynamic note = noteController.text;
      final dynamic z = dropdownValue;
      final dynamic p = dropdownValue2;

      final FirebaseFirestore _db = FirebaseFirestore.instance;
      final snapShot = await _db
          .collection(widget.patientName)
          .doc('uid2')
          .collection('Records')
          .doc(_chosenDateTime.toString().substring(0, 10))
          .get();
      if (snapShot.exists) {
        await _db
            .collection(widget.patientName)
            .doc('uid2')
            .collection('Records')
            .doc(_chosenDateTime.toString().substring(0, 10))
            .update({
          'Name': widget.patientName,
          z+' sugar': x,
          z+' bp': y,
          z+' food': p,
          z+ ' note': note,
          'input time': _chosenDateTime.toString().substring(0, 16),
          z+' recorded by': uid
        });
      }
      else {
        await _db
            .collection(widget.patientName)
            .doc('uid2')
            .collection('Records')
            .doc(_chosenDateTime.toString().substring(0, 10))
            .set({
          'Name': widget.patientName,
          z+' sugar': x,
          z+' bp': y,
          z+' food': p,
          z+ ' note': note,
          'input time': _chosenDateTime.toString().substring(0, 16),
          z+' recorded by': uid
        });
      }
    }
  }
}