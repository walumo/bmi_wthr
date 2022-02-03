import 'package:flutter/material.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);

enum Calculate {
  bmi,
  wthr,
  back,
}

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.label, @required this.type});

  final String label;
  final Calculate type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: bottomContainerColor,
      ),
      margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      height: bottomContainerHeight,
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 18.0, letterSpacing: 2.0),
        ),
      ),
    );
  }
}
