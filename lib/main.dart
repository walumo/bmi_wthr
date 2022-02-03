import 'dart:ui';
import 'package:bmi_calculator/routes/result_screen.dart';
import 'routes/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/input',
      routes: {
        '/input': (context) => InputPage(),
        '/results': (context) => ResultScreen(),
      },
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0D101E),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.grey,
        ),
        scaffoldBackgroundColor:const Color(0xFF0D101E),
      ),
    );
  }
}
