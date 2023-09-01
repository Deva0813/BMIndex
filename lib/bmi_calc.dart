// import 'dart:math';
//
// class BMICalc {
//   BMICalc({required this.height, required this.weight});
//
//   final int height;
//   final int weight;
//
//   double _bmi = 0.0;
//   String _result = "";
//   String _interpretation = "";
//   String _range = "";
//   String _textColor = "";
//
//   String calculateBMI() {
//     _bmi = weight / pow(height / 100, 2);
//     return _bmi.toStringAsFixed(1);
//   }
//
//   String getResult() {
//     if (_bmi >= 25) {
//       _result = "Overweight";
//     } else if (_bmi > 18.5) {
//       _result = "Normal";
//     } else {
//       _result = "Underweight";
//     }
//     return _result;
//   }
//
//   String getInterpretation() {
//     if (_bmi >= 25) {
//       _interpretation =
//           "You have a higher than normal body weight. Try to exercise more.";
//     } else if (_bmi > 18.5) {
//       _interpretation = "You have a normal body weight. Good job!";
//     } else {
//       _interpretation =
//           "You have a lower than normal body weight. You can eat a bit more.";
//     }
//     return _interpretation;
//   }
//
//   String getRange() {
//     if (_bmi >= 25) {
//       _range = "25 - 29.9";
//     } else if (_bmi > 18.5) {
//       _range = "18.5 - 24.9";
//     } else {
//       _range = "0 - 18.4";
//     }
//     return _range;
//   }
//
//   String getTextColor() {
//
// if (_bmi >= 25) {
//       _textColor = "0xFFFF1744";
//     } else if (_bmi > 18.5) {
//       _textColor = "0xFF00E676";
//     } else {
//       _textColor = "0xFFFFEB3B";
//     }
//
//     return _textColor;
//   }
//
// }
import 'dart:math';

class BMICalc {
  BMICalc({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  final int height;
  final int weight;
  final int age;
  final String gender;

  double _bmi = 0.0;
  String _result = "";
  String _interpretation = "";
  String _range = "";
  String _textColor = "";

  String calculateBMI() {
    if (age >= 18) {
      _bmi = weight / pow(height / 100, 2);
    } else {
      // Adjust the BMI calculation for individuals under 18
      if (gender == "male") {
        _bmi = 1.51 * (weight / pow(height / 100, 2)) - 0.70;
      } else {
        _bmi = 1.51 * (weight / pow(height / 100, 2)) - 0.60;
      }
    }
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      _result = "Overweight";
    } else if (_bmi > 18.5) {
      _result = "Normal";
    } else {
      _result = "Underweight";
    }
    return _result;
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      _interpretation =
      "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      _interpretation = "You have a normal body weight. Good job!";
    } else {
      _interpretation =
      "You have a lower than normal body weight. You can eat a bit more.";
    }
    return _interpretation;
  }

  String getRange() {
    if (_bmi >= 25) {
      _range = "25 - 29.9";
    } else if (_bmi > 18.5) {
      _range = "18.5 - 24.9";
    } else {
      _range = "0 - 18.4";
    }
    return _range;
  }

  String getTextColor() {
    if (_bmi >= 25) {
      _textColor = "0xFFFF1744";
    } else if (_bmi > 18.5) {
      _textColor = "0xFF00E676";
    } else {
      _textColor = "0xFFFFEB3B";
    }
    return _textColor;
  }
}
