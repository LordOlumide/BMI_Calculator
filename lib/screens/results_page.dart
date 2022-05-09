import 'package:bmi_calculator_reboot/components/custom_card.dart';
import 'package:bmi_calculator_reboot/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_reboot/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  String bmi;
  String resultLabel;
  String interpretation;

  ResultPage({
    required this.bmi,
    required this.resultLabel,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: const Text(
              'Your Results',
              style: kHeaderTextStyle,
            ),
          ),
          Expanded(
            child: CustomCard(
              colour: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmi,
                    style: kResultTextStyle,
                  ),
                  Text(
                    resultLabel,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBMIMeaningTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            label: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
