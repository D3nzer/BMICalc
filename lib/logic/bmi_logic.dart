import 'package:flutter/material.dart';

String calculateBMI(int height, int weight) {
  double bmi = weight / (height * height) * 10000;
  return bmi.toStringAsFixed(1);
}

String getBMIResult(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'Normal';
  } else if (bmi >= 25 && bmi < 30) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}

String getBMIFeedBack(double bmi) {
  if (bmi < 18.5) {
    return 'A BMI of less than 18.5 indicates that you are underweight, so you may need to put on some weight. You are recommended to ask your doctor or a dietitian for advice.';
  } else if (bmi >= 18.5 && bmi < 25) {
    return 'A BMI of 18.5-24.9 indicates that you are at a healthy weight for your height. By maintaining a healthy weight, you lower your risk of developing serious health problems.';
  } else if (bmi >= 25 && bmi < 30) {
    return 'A BMI of 25-29.9 indicates that you are slightly overweight. You may be advised to lose some weight for health reasons. You are recommended to talk to your doctor or a dietitian for advice.';
  } else {
    return 'A BMI of over 30 indicates that you are heavily overweight. Your health may be at risk if you do not lose weight. You are recommended to talk to your doctor or a dietitian for advice';
  }
}

Color getBMIBackground(double bmi) {
  if (bmi < 18.5) {
    return const Color(0xFF1C2331);
  } else if (bmi >= 18.5 && bmi < 25) {
    return const Color(0xFF24AC6E);
  } else if (bmi >= 25 && bmi < 30) {
    return const Color(0xFFFAAF3D);
  } else {
    return const Color(0xFFFA4C61);
  }
}
