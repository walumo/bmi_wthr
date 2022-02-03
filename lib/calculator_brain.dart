import 'calculate_button.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'info_list.dart';


class CalculatorBrain {

  CalculatorBrain(
      {this.isMale, this.height, this.waist, this.weight, this.age, this.type});

  final bool isMale;
  final int height;
  final int waist;
  final int weight;
  final int age;
  final Calculate type;
  double _bmi;
  double _wthr;
  double _factor;

  String getResult() {
    if (type == Calculate.bmi && isMale == true) {
      _bmi = weight / pow(height / 100, 2);
      return _bmi.toStringAsFixed(1);
    } else if (type == Calculate.bmi && isMale == false) {
      _bmi = weight / pow(height / 100, 2);
      return _bmi.toStringAsFixed(1);
    } else if (type == Calculate.wthr && isMale == true) {
      _wthr = waist / height;
      return _wthr.toStringAsFixed(2);
    } else if (type == Calculate.wthr && isMale == false) {
      _wthr = waist / height;
      return _wthr.toStringAsFixed(2);
    } else {
      return 'Error';
    }
  }

  Text getLabel() {
    _factor = age / 1500; //Age factor variable to use after 40 years of age
    if (type == Calculate.bmi && _bmi >= 25.0) {
      return label[0];
    } else if (type == Calculate.bmi && _bmi >= 18.5) {
      return label[1];
    } else if (type == Calculate.bmi && _bmi < 18.5) {
      return label[2];
    } else if (type == Calculate.wthr && isMale == true && age <=40 && _wthr >= 0.53) {
      return label[0];
    } else if (type == Calculate.wthr && isMale == true && age <=40 && _wthr >= 0.43) {
      return label[1];
    } else if (type == Calculate.wthr && isMale == true && age <=40 && _wthr < 0.43) {
      return label[2];
    } else if (type == Calculate.wthr && isMale == false && age <=40 && _wthr >= 0.49) {
      return label[0];
    } else if (type == Calculate.wthr && isMale == false && age <=40 && _wthr >= 0.42) {
      return label[1];
    } else if (type == Calculate.wthr && isMale == false && age <=40 && _wthr < 0.42) {
      return label[2];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.53+_factor) {
    return label[0];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.43+_factor) {
    return label[1];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr < 0.43+_factor) {
    return label[2];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.49+_factor) {
    return label[0];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.42+_factor) {
    return label[1];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr < 0.42+_factor) {
    return label[2];
    } else {
      return Text('Error');
    }
  }

  String getInfo() {
    _factor = age /1500; //Age factor variable to use after 40 years of age
    if (type == Calculate.bmi && _bmi >= 40.0) {
      return info[0];
    } else if (type == Calculate.bmi && _bmi >= 35.0) {
      return info[1];
    } else if (type == Calculate.bmi && _bmi >= 30.0) {
      return info[2];
    } else if (type == Calculate.bmi && _bmi >= 25.0) {
      return info[3];
    } else if (type == Calculate.bmi && _bmi >= 18.5) {
      return info[4];
    } else if (type == Calculate.bmi && _bmi >= 17.0) {
      return info[5];
    } else if (type == Calculate.bmi && _bmi >= 16.0) {
      return info[6];
    } else if (type == Calculate.bmi && _bmi < 16.0) {
      return info[7];
    } else if (type == Calculate.wthr && isMale == true && age <= 40 && _wthr >= 0.63) {
      return info[8];
    } else if (type == Calculate.wthr && isMale == true && age <= 40  && _wthr >= 0.58) {
      return info[9];
    } else if (type == Calculate.wthr && isMale == true && age <= 40  && _wthr >= 0.53) {
      return info[10];
    } else if (type == Calculate.wthr && isMale == true && age <= 40  && _wthr >= 0.43) {
      return info[11];
    } else if (type == Calculate.wthr && isMale == true && age <= 40  && _wthr >= 0.35) {
      return info[12];
    } else if (type == Calculate.wthr && isMale == true && age <= 40  && _wthr < 0.35) {
      return info[13];
    } else if (type == Calculate.wthr && isMale == false && age <= 40  && _wthr >= 0.58) {
      return info[8];
    } else if (type == Calculate.wthr && isMale == false && age <= 40  && _wthr >= 0.54) {
      return info[9];
    } else if (type == Calculate.wthr && isMale == false && age <= 40  && _wthr >= 0.49) {
      return info[10];
    } else if (type == Calculate.wthr && isMale == false && age <= 40  && _wthr >= 0.42) {
      return info[11];
    } else if (type == Calculate.wthr && isMale == false && age <= 40  && _wthr >= 0.35) {
      return info[12];
    } else if (type == Calculate.wthr && isMale == false && age <= 40  && _wthr < 0.35) {
      return info[13];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.63+_factor) {
      return info[8];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.58+_factor) {
      return info[9];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.53+_factor) {
      return info[10];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.43+_factor) {
      return info[11];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr >= 0.35+_factor) {
      return info[12];
    } else if (type == Calculate.wthr && isMale == true && age >40 && _wthr < 0.35+_factor) {
      return info[13];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.58+_factor) {
      return info[8];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.54+_factor) {
      return info[9];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.49+_factor) {
      return info[10];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.42+_factor) {
      return info[11];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr >= 0.35+_factor) {
      return info[12];
    } else if (type == Calculate.wthr && isMale == false && age >40 && _wthr < 0.35+_factor) {
      return info[13];
    } else {
      return 'Error';
    }
  }
}