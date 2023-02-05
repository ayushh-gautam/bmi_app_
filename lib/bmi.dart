// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'widgets.dart';

import 'constants.dart';

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
  int height = 150;
  int weight = 30;
  int age = 16;
  Gender? selectedGender;

  void reset() {
    setState(() {
      height = 0;
      weight = 0;
      age = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /*----------------------GENDER SECTION------------------------*/
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
                        ? kActiveBoxColors
                        : kInactiveBoxColors,
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
                          ? kActiveBoxColors
                          : kInactiveBoxColors,
                      cardChild: IconWidget(
                        icon: (Icons.female),
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /*------------------------HEIGHT SECTION-----------------------*/
            Expanded(
                child: CustomCard(
              colour: kActiveBoxColors,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        overlayColor: Color(0x29EB1555)),
                    child: Slider(
                      min: 130.0,
                      max: 200.0,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),

            /*---------------------WEIGHTT & AGE SECTIONN---------------------------*/
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CustomCard(
                    colour: kActiveBoxColors,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                  /* -----------------------AGE SECTION-----------------------*/
                  Expanded(
                      child: CustomCard(
                    colour: kActiveBoxColors,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),

            /*---------CALCULATE BUTTON-------------------*/
            GestureDetector(
              onTap: (() {
                reset();
              }),
              child: Container(
                margin: EdgeInsets.only(top: 9.0),
                decoration: BoxDecoration(
                    color: kContainerColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9),
                        topRight: Radius.circular(9))),
                height: kContainerHeight,
                width: double.infinity,
                child: Center(
                  child: Text(
                    'CACLCULATE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
