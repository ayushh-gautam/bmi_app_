// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names
import 'package:bmi_calculator/bmi.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'widgets.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.bmiText,
      @required this.bmiInterpretion});
  final String? bmiResult;
  final String? bmiText;
  final String? bmiInterpretion;

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
                      bmiText.toString().toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult.toString(),
                      style: kBmiResultStyle,
                    ),
                    Text(
                      bmiInterpretion.toString(),
                      textAlign: TextAlign.center,
                      style: kNotationStyle,
                    )
                  ],
                ),
              )),
          BottomCalculateConainer(
            buttonTiltle: 'RE-CALCULATE',
            onTap: (() {
              Navigator.pop(context);
            }),
          ),
        ],
      ),
    );
  }
}
