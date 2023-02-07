// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'constants.dart';
import 'results.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key, @required this.colour, this.cardChild, this.onPressed});
  final Widget? cardChild;
  Color? colour;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(9),
        ),
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  final IconData? icon;
  final String? label;
  const IconWidget({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label!,
          style: TextStyle(color: Color(0xFF808E98)),
        )
      ],
    );
  }
}

/*--------------------- HEIGHT WEIGHT AGE CUSTOM BUTTON ---------------------*/
class RoundIconButton extends StatelessWidget {
  const RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      fillColor: Color(0XFF4C4F5E),
      shape: CircleBorder(),
    );
  }
}

/*-------------------- BUTTOM BUTTON -------------------------------*/
class BottomCalculateConainer extends StatelessWidget {
  BottomCalculateConainer({@required this.onTap, @required this.buttonTiltle});
  final Function()? onTap;
  final String? buttonTiltle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 9.0),
        decoration: BoxDecoration(
            color: kContainerColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9), topRight: Radius.circular(9))),
        height: kContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            buttonTiltle!,
            style: kCalculateButtonStyle,
          ),
        ),
      ),
    );
  }
}
