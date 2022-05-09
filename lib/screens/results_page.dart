import 'package:bmi_calculator_reboot/components/custom_card.dart';
import 'package:bmi_calculator_reboot/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_reboot/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

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
          Container(child: Text('Your Results')),
          Expanded(child: CustomCard(colour: kActiveCardColour)),
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
