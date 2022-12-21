import 'package:flutter/material.dart';

const kTempTextStyle=TextStyle(
  fontFamily: 'Spartan MB',
  fontSize:100.0,
);
const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
  color: Colors.black
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const KTextFieldStyle= InputDecoration(
  filled: true,
  fillColor: Colors.teal,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
    borderSide: BorderSide.none,
  ),

  hintText: 'Enter City name',
  hintStyle: TextStyle(color: Colors.black),

  prefixIcon: Icon(Icons.home_rounded,size: 30,color: Colors.black,),

);