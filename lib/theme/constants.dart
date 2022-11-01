import 'package:flutter/material.dart';

const kTextTopStyle = TextStyle(
  color: Colors.white,
  fontSize: 50,
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
