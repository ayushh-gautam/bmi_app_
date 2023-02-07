// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            child: Text(
              'Your Resut',
              style: kTitleStyle,
            ),
          )),
          Expanded(
              flex: 5,
              child: CustomCard(
                colour: kActiveBoxColors,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Normal',
                      style: kResultTextStyle,
                    ),
                    Text(
                      '68',
                      style: kBmiResultStyle,
                    ),
                    Text(
                      'You are currently underweight, do some exercise',
                      textAlign: TextAlign.center,
                      style: kNotationStyle,
                    )
                  ],
                ),
              )),
          BottomCalculateConainer(
            buttonTiltle: 'RE-CALCULATE',
            onTap: (() {}),
          ),
        ],
      ),
    );
  }
}
