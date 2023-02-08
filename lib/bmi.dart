// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/results.dart';
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
  int weight = 60;
  int age = 16;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
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
                      min: 120.0,
                      max: 230.0,
                      value: height.toDouble(),
                      onChanged: (double myNewValue) {
                        setState(() {
                          height = myNewValue.round();
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

                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: (() {
                                  setState(() {
                                    weight--;
                                  });
                                })),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                                icon: Icons.add,
                                onPressed: (() {
                                  setState(() {
                                    weight++;
                                  });
                                }))
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
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icons.remove,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icons.add,
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),

            //=======35:44

            /*---------CALCULATE BUTTON-------------------*/
            BottomCalculateConainer(
              buttonTiltle: 'CALCULATE',
              onTap: (() {
                BmiCalculator calcu =
                    BmiCalculator(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calcu.calculateBmi(),
                              bmiText: calcu.getResult(),
                              bmiInterpretion: calcu.getInterpretation(),
                            )));
              }),
            )
          ],
        ));
  }
}
