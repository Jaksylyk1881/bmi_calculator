import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../functionality/bmi_brain.dart';

enum GenderType { male, female, not }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.not;
  int height = 170;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    colour: (selectedGender == GenderType.male)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: const GenderColumn(
                      icon: Icons.male,
                      text: 'MALE',
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: (selectedGender == GenderType.female)
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    child: const GenderColumn(
                      icon: Icons.female,
                      text: 'FEMALE',
                    ),
                    onPressed: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                  )),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: kInactiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        ' cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kActiveSliderColor,
                        thumbColor: kBottomContainerColor,
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25.0)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: kMinValueOfSlider,
                      max: kMaxValueOfSlider,
                    ),
                  )
                ],
              ),
              onPressed: () {},
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight >= 10) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(width: 15),
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kInactiveCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundedIconButton(
                                  iconData: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 1) {
                                        age--;
                                      }
                                    });
                                  }),
                              const SizedBox(
                                width: 15.0,
                              ),
                              RoundedIconButton(
                                  iconData: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onPressed: () {
                BmiBrain bmiBrain = BmiBrain(height, weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Results(
                              bmiValue: bmiBrain.bmiValue(),
                              result: bmiBrain.getResult(),
                              interpretation: bmiBrain.getInterpretation(),
                            )));
              },
              title: 'CALCULATE',
            )
          ],
        ));
  }
}

class RoundedIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 5.0,
      child: Icon(
        iconData,
        color: Colors.white,
      ),
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xff1C1F32),
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
    );
  }

  const RoundedIconButton({required this.iconData, required this.onPressed});
}
