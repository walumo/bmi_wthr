
import 'package:flutter/material.dart';

List<String> info = [
  'You are obese class 3. You should consult a doctor about weight loss. Healthy diet and exercise should become your daily routine starting right now!',
  'You are obese class 2. Consider consulting a doctor about weight loss. Healthy diet and exercise should become your daily routine starting right now!',
  'You are obese class 1. Healthy diet and exercise should become your daily routine starting right now!',
  'You are overweight. Healthy diet and exercise should be taken into consideration.',
  'Your weight is normal. You should still eat healthy and exercise to keep up your health.',
  'You are mildly thin. You should eat healthy and exercise to keep up your health. There is no need for additional weight loss. ',
  'You are moderately thin. You should gain a little weight to stay healthy. Adjust your eating and exercise.',
  'You are severely thin. It will be dangerous to lose any more weight. Consider consulting a doctor about your situation.',
  'You are obese. Consider consulting a doctor about weight loss. Healthy diet and exercise should become your daily routine starting right now!',
  'You are very overweight. Healthy diet and exercise should become your daily routine starting right now!',
  'You are overweight. Healthy diet and exercise should be taken into consideration.',
  'You are healthy. You should still eat right and exercise to keep up your health.',
  'You are mildly thin. You should eat healthy and exercise to keep up your health. There is no need for additional weight loss.',
  'You are severely thin. It will be dangerous to lose any more weight. Consider consulting a doctor about your situation.',
];

List<Text> label = [
  Text(
    'OVERWEIGHT',
    style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w900,
      fontSize: 30.0,
    ),
  ),
  Text(
    'NORMAL',
    style: TextStyle(
      color: Colors.green,
      fontWeight: FontWeight.w900,
      fontSize: 30.0,
    ),
  ),
  Text(
    'UNDERWEIGHT',
    style: TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.w900,
      fontSize: 30.0,
    ),
  ),
];