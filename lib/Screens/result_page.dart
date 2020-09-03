import 'package:flutter/material.dart';
import 'package:testq/Components/bottom_button.dart';
import 'package:testq/Components/reusable_card.dart';
import 'package:testq/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiText,
      @required this.bmiNum,
      @required this.bmiInterpretation});

  final String bmiText;
  final String bmiNum;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Center(
                    child: Text(
                  'Your Result!',
                  style: kTitleTextStyle,
                )),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                color: kActiveContainerColor,
                childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        bmiText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiNum,
                        style: kBMITextStyle,
                      ),
                      Text(
                        bmiInterpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ]),
              ),
            ),
            BottomButton(
                bottomText: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                })
          ]),
    );
  }
}
