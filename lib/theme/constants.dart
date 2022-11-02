import 'package:flutter/material.dart';

const kBlueColor = Color(0xff222952);
const kTextTopStyle = TextStyle(
    color: Colors.white,
    fontSize: 50,
    fontFamily: 'Shadows',
    shadows: [
      Shadow(color: Colors.white, blurRadius: 7.0, offset: Offset(0, 0))
    ]);

const kTextfieldTextStyle = TextStyle(
  color: Color(0xff222952),
  fontSize: 22.0,
  fontFamily: 'Shadows',
);

const kContainerTextStyle = TextStyle(
  color: Color(0xff222952),
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Ubuntu',
  height: 1.3,
);

const kSignButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 23.0,
  fontFamily: 'Ubuntu',
);
const kBackgroundColors = RadialGradient(
  radius: 0.4,
  stops: [0.0, 0.5, 0.5, 1],
  tileMode: TileMode.repeated,
  colors: [
    Color(0xffa89bfe),
    Color(0xffa89bfe),
    Color(0xffb3a8fe),
    Color(0xffb3a8fe),
  ],
);

const kContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  icon: Icon(
    Icons.alternate_email,
    size: 30.0,
    color: Colors.grey,
  ),
  hintText: 'Enter Your ID',
  hintStyle: TextStyle(
    fontFamily: 'Ubuntu',
    fontSize: 20.0,
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: kBlueColor),
  ),
);

const kSignupButtonColors = [
  Color(0xffffab4a),
  Color(0xffffc580),
  Color(0xffffc580),
  Color(0xffffc580),
  Color(0xffffab4a),
];

const kSigninButtonColors = [
  Color(0xFF40B4EE),
  Color(0xff56c8ff),
  Color(0xff56c8ff),
  Color(0xff56c8ff),
  Color(0xff56c8ff),
  Color(0xFF40B4EE)
];
