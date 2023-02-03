// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'widgets.dart';

const activeBoxColors = Color(0xFF1D1E33);
const inactiveBoxColors = Color(0xFF101427);
const containerHeight = 80.0;
const containerColor = Color(0xFFEB1555);

enum Gender {
  male,
  female,
}

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  Gender? selectedGender;

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
                  Expanded(
                      child: CustomCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeBoxColors
                        : inactiveBoxColors,
                    cardChild: IconWidget(
                      icon: (Icons.male),
                      label: 'MALE',
                    ),
                  )),
                  Expanded(
                    child: CustomCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? activeBoxColors
                          : inactiveBoxColors,
                      cardChild: IconWidget(
                        icon: (Icons.female),
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: CustomCard(colour: activeBoxColors)),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: CustomCard(colour: activeBoxColors)),
                  Expanded(child: CustomCard(colour: activeBoxColors))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 9.0),
              decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9))),
              height: containerHeight,
              width: double.infinity,
            )
          ],
        ));
  }
}
//14:44