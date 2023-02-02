// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'widgets.dart';

const containerHeight = 80.0;
const boxColors = 0xFF1D1E33;

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: CustomCard(colour: Color(boxColors))),
                  Expanded(
                    child: CustomCard(colour: Color(boxColors)),
                  ),
                ],
              ),
            ),
            Expanded(child: CustomCard(colour: Color(boxColors))),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: CustomCard(colour: Color(boxColors))),
                  Expanded(child: CustomCard(colour: Color(boxColors)))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: containerHeight,
              width: double.infinity,
              color: Colors.pink.shade700,
            )
          ],
        ));
  }
}
