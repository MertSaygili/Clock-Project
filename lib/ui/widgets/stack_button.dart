// ignore_for_file: prefer_const_constructors

import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

class StackButton extends StatefulWidget {
  const StackButton({Key? key}) : super(key: key);

  @override
  State<StackButton> createState() => _StackButtonState();
}

class _StackButtonState extends State<StackButton> {
  Alignment _alignment = Alignment.centerLeft;
  Color _color = AllColors().colorLightGray;
  final double _mainContainerHeight = 35;
  final double _mainContainerWidth = 70;

  @override
  Widget build(BuildContext context) {
    // for background container
    final BoxDecoration mainContainerDecoration = BoxDecoration(
      color: _color,
      borderRadius: BorderRadius.circular(25),
    );
    // for foreground animated container
    final BoxDecoration animatedContainerDecoration = BoxDecoration(
      color: AllColors().colorWhite,
      shape: BoxShape.circle,
      border: Border.all(color: AllColors().colorGrey),
    );

    // for animated containers
    final Duration duration = Duration(milliseconds: 500);

    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: _changeAlignment,
        child: Container(
          height: _mainContainerHeight,
          width: _mainContainerWidth,
          decoration: mainContainerDecoration,
          child: _animatedStackContainer(duration, animatedContainerDecoration),
        ),
      ),
    );
  }

  // widget methods
  Stack _animatedStackContainer(
      Duration duration, BoxDecoration animatedContainerDecoration) {
    return Stack(
      children: [
        AnimatedAlign(
          alignment: _alignment,
          duration: duration,
          child: AnimatedContainer(
            height: _mainContainerHeight,
            width: _mainContainerWidth / 2,
            duration: duration,
            curve: Curves.easeIn,
            decoration: animatedContainerDecoration,
            child: GestureDetector(onTap: _changeAlignment),
          ),
        ),
      ],
    );
  }

  // functions
  void _changeAlignment() {
    if (_alignment == Alignment.centerLeft) {
      setState(() {
        _alignment = Alignment.centerRight;
        _color = AllColors().colordeepPurpleAccent;
      });
    } else {
      setState(() {
        _alignment = Alignment.centerLeft;
        _color = AllColors().colorLightGray;
      });
    }
  }
}
