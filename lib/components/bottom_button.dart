import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_reboot/constants.dart';

class BottomButton extends StatelessWidget {
  final label;
  final Function onPressed;
  BottomButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      padding: EdgeInsets.only(bottom: 15.0),
      fillColor: kBottomButtonColour,
      constraints: BoxConstraints(
        minHeight: 90.0,
        minWidth: double.infinity,
      ),
      child: Text(
        label,
        style: kBottomButtonTextStyle,
      ),
    );
  }
}
