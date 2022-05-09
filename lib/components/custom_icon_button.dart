import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;

  CustomIconButton({required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Icon(iconData),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}