import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testq/Components/reusable_card.dart';
import 'package:testq/calculator_brain.dart';
import 'package:testq/constants.dart';
import 'package:testq/Components/icon_content.dart';
import 'package:testq/Components/round_icon_button.dart';
import 'package:testq/Components/bottom_button.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveContainerColor;
  Color femaleCardColor = kInactiveContainerColor;

  Gender selectedGender;

  int height = 180;
  int weight = 75;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
          ),
          leading: Icon(Icons.menu),
          centerTitle: true,
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            color: selectedGender == Gender.male
                                ? kActiveContainerColor
                                : kInactiveContainerColor,
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                            childCard: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconContent(
                                    icon: FontAwesomeIcons.mars,
                                    label: 'MALE',
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            color: selectedGender == Gender.female
                                ? kActiveContainerColor
                                : kInactiveContainerColor,
                            childCard: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  IconContent(
                                    icon: FontAwesomeIcons.venus,
                                    label: 'FEMALE',
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kInactiveContainerColor,
                      childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Height', style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: <Widget>[
                                Text(height.toString(),
                                    style: kNumberTextStyle),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            color: kInactiveContainerColor,
                            childCard: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('Weight', style: kLabelTextStyle),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.ideographic,
                                    children: <Widget>[
                                      Text(
                                        weight.toString(),
                                        style: kNumberTextStyle,
                                      ),
                                      Text(
                                        'kg',
                                        style: kLabelTextStyle,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              weight--;
                                            });
                                          }),
                                      SizedBox(width: 10.0),
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              weight++;
                                            });
                                          }),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            color: kInactiveContainerColor,
                            childCard: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text('Age', style: kLabelTextStyle),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.ideographic,
                                    children: <Widget>[
                                      Text(
                                        age.toString(),
                                        style: kNumberTextStyle,
                                      ),
                                      Text(
                                        'yr',
                                        style: kLabelTextStyle,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              age--;
                                            });
                                          }),
                                      SizedBox(width: 10.0),
                                      RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              age++;
                                            });
                                          }),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BottomButton(
                    bottomText: 'CALCULATE',
                    onTap: () {
                      CalculatorBrain calc = CalculatorBrain(
                        height: height,
                        weight: weight,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            bmiNum: calc.calculateBMI(),
                            bmiText: calc.getResult(),
                            bmiInterpretation: calc.getInterpretation(),
                          ),
                        ),
                      );
                    },
                  ),
                ]);
          } else {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: kInactiveContainerColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconContent(
                                  icon: FontAwesomeIcons.mars,
                                  label: 'MALE',
                                ),
                              ]),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: kInactiveContainerColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconContent(
                                  icon: FontAwesomeIcons.mars,
                                  label: 'MALE',
                                ),
                              ]),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                )
              ],
            );
          }
        }));
  }
}
