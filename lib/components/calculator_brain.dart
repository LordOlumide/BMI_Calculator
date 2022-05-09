import 'dart:math';

class CalculatorBrain {
  CalculatorBrain();

  late double _bmi;

  String getBMI({required height, required weight}) {
    _bmi = weight / pow( height/100, 2 );
    return _bmi.toStringAsFixed(1) as String;
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getMeaning() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight. Exercise to keep fit.';
    } else {
      return 'You have a lower than normal body weight. Try to buff up.';
    }
  }
}
