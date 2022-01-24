import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class Results extends StatelessWidget {
  final String bmiValue;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Your Results',
                    style: kResultPageTitleStyle,
                  ))),
          Expanded(
              flex: 6,
              child: ReusableCard(
                colour: kActiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                     Text(
                      result.toUpperCase(),
                      style: kResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                     Text(
                      bmiValue,
                      style: kNumberResultTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Normal BMI range:',
                          style: kLabelTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '18,5 - 25kg/m2',
                          textAlign: TextAlign.center,
                          style: kNormalTextStyle,
                        )
                      ],
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        interpretation,
                        style: kNormalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              )),
          BottomButton(
              onPressed: () => Navigator.pop(context),
              title: 'RE-CALCULATE YOUR BMI')
        ],
      ),
    );
  }

  Results(
      {required this.bmiValue,
      required this.result,
      required this.interpretation});
}
