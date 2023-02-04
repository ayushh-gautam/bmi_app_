import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, @required this.colour, this.cardChild, this.onPressed});
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
  IconWidget({this.icon, this.label});

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



