// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names, body_might_complete_normally_nullable, unused_local_variable

import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});
  final int? height;
  final int? weight;

  dynamic _bmi;

  String? calculateBmi() {
    _bmi = weight! / (pow(height! / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String? getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String? getInterpretation() {
    if (_bmi >= 25) {
      return 'You have higher than normal body weight fatso! Exercise more!!';
    } else if (_bmi >= 18.5) {
      return 'Congratulations! You have an normal body weight.';
    } else {
      return 'Eat more and exercise more you thin ass bamboo!';
    }
  }
}
