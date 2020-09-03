import 'package:flutter/material.dart';
import 'package:testq/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.bottomText, @required this.onTap});

  final String bottomText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
        child: Center(
          child: Text(bottomText, style: kLargeBottomTextStyle),
        ),
      ),
    );
  }
}
