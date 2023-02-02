// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'bmi.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF090C22),
      appBarTheme: const AppBarTheme(color: Color(0xFF090C22)),
      scaffoldBackgroundColor: const Color(0xFF090C22),
    ),
    home: const BmiApp(),
  ));
}
