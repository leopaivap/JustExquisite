import 'package:flutter/material.dart';

const kTitleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 23);

const kAppBarTitle = TextStyle(fontWeight: FontWeight.bold, fontSize: 25);

const kLitteTextWhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

const kLitteTextBlack = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

final kButtonColorWhite = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
);

final kButtonColorBlack = ButtonStyle(
  backgroundColor:
      MaterialStateProperty.all<Color>(const Color.fromRGBO(0, 0, 0, 0.8)),
);
