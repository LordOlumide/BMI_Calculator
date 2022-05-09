import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_reboot/constants.dart';
import 'package:bmi_calculator_reboot/components/custom_card.dart';
import 'package:bmi_calculator_reboot/components/bottom_button.dart';
import 'package:bmi_calculator_reboot/screens/results_page.dart';
import 'package:bmi_calculator_reboot/components/custom_icon_button.dart';
import 'package:bmi_calculator_reboot/components/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 25;
  Gender? selectedGender;
  CalculatorBrain calc = CalculatorBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Male - Female choose gender cards
          Expanded(
            child: Row(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: CustomCard(
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 80.0,
                        ),
                        Text(
                          'MALE',
                          style: kInputPageTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: CustomCard(
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 80.0,
                        ),
                        Text(
                          'FEMALE',
                          style: kInputPageTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // Height and slider container
          Expanded(
            child: CustomCard(
              colour: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kInputPageTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 240.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Weight and age containers
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    colour: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kInputPageTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBigAgeAndWeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10),
                            CustomIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    colour: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kInputPageTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBigAgeAndWeightTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(width: 10),
                            CustomIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Bottom Button
          BottomButton(
            label: 'CALCULATE',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmi: calc.getBMI(height: height, weight: weight),
                  resultLabel: calc.getResult(),
                  interpretation: calc.getMeaning(),
                );
              }));
            },
          ),
        ],
      ),
    );
  }
}

