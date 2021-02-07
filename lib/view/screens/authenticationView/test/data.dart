import 'package:flutter/material.dart';

// Textsryle styler style

TextStyle titleTextStyle({Color color}) {
  return TextStyle(
    fontFamily: 'Circular Std Medium',
    fontSize: 27.0,
    color: color,
    height: 1.33,
  );
}

TextStyle descpTextStyle({
  Color color,
}) {
  return TextStyle(
    fontFamily: 'Circular Std Book',
    fontSize: 17.0,
    color: color,
    height: 1.56,
  );
}

TextStyle smallTextStyle({Color color,double size}) {
  return TextStyle(
    fontFamily: 'Circular Std Medium',
    fontSize: size,
    color: color,
    height: 0.92,
  );
}

TextStyle hintTextStyle() {
  return TextStyle(
    fontFamily: 'Circular Std Book',
    fontSize: 17.0,
    color: const Color(0xFFC3CCDB),
  );
}

TextStyle buttonTextStyle() {
  return TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    letterSpacing: 0.64,
    fontWeight: FontWeight.w500,
  );
}

// Textstyle styler style

// Color color color color

const Color kprimaryColor = Color(0xff0001FC);
const Color tPurple = Color(0xFF9647FF);
const Color tBlue = Color(0xFF005FDC);
const Color tBlueAccent = Color(0xFF1EC2FF);
const Color tGreenAccent = Color(0xFF00DCCD);
const Color tGreen = Color(0xFF14D98F);
const Color tYellow = Color(0xFFE9A608);
const Color tPink = Color(0xFFFF6868);

// Color color color color

// ------------ SİZED BOX HEİGHT --------------

const sheight5 = SizedBox(height: 5.0);
const sheight10 = SizedBox(height: 10);
const sheight15 = SizedBox(height: 15);
const sheight20 = SizedBox(height: 20);
const sheight30 = SizedBox(height: 30);
const sheight40 = SizedBox(height: 40);
const sheight50 = SizedBox(height: 50);
const sheight60 = SizedBox(height: 60);
const sheight90 = SizedBox(height: 90);

// ------------ SİZED BOX HEİGHT -----------

// ------------ SİZED BOX WEİGHT -----------

const swidth5 = SizedBox(width: 5.0);
const swidth10 = SizedBox(width: 10);
const swidth15 = SizedBox(width: 15);
const swidth20 = SizedBox(width: 20);
const swidth30 = SizedBox(width: 30);

// ------------ SİZED BOX WEİGHT --------------
