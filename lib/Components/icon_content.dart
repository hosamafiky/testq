import 'package:flutter/material.dart';
import 'package:testq/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFF8b8d9a),
        ),
        SizedBox(height: 10.0),
        Text(label, style: kLabelTextStyle),
      ],
    );
  }
}
