import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon,@required this.iconColor, @required this.gender});

  final IconData icon;
  final String gender;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender.toUpperCase(),
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
