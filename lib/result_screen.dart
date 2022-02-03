import 'package:bmi_calculator/calculate_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

class ResultScreen extends StatelessWidget {

  final ResultData resultData;

  ResultScreen({this.resultData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Results:'),
          centerTitle: true,
          backgroundColor: Color(0xFF0D101E),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ReusableCard(
                newColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    resultData.dataResultLabel,
                    Text(resultData.dataResult, style: kResultTextStyle),
                    Container(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Text(
                        resultData.dataResultInfo,
                        style: kResultInfoTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 90.0,
              child: GestureDetector(
                child: CalculateButton(label: 'GO BACK', type: Calculate.back),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ));
  }
}
