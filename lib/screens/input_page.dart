import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_reboot/constants.dart';
import 'package:bmi_calculator_reboot/components/custom_card.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: CustomCard(
                  colour: kActiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 80.0,
                      ),
                      Text(
                        'MALE',
                        style: kInputPageFontStyle,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  colour: kActiveCardColour,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 80.0,
                      ),
                      Text(
                        'FEMALE',
                        style: kInputPageFontStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: CustomCard(
              colour: kActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    colour: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    colour: kActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          RawMaterialButton(
            onPressed: null,
            fillColor: Color(0xFF0D0D3B),
            constraints: BoxConstraints(
              minHeight: 50.0,
              minWidth: double.infinity,
            ),
            child: Text(
              'Calculate',
            ),
          )
        ],
      ),
    );
  }
}
