import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({Key? key, required this.icon}) : super(key: key);

  final Icon icon;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: widget.icon,
      padding: EdgeInsets.zero,
      iconSize: FontSizes().sizeMaxXX,
      color: AllColors().colorBlack,
    );
  }
}
