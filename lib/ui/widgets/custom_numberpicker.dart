import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker({
    Key? key,
    required this.fun,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  final Function fun;
  final int minValue;
  final int maxValue;

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      step: 1,
      itemCount: 3,
      selectedTextStyle: Theme.of(context).textTheme.caption,
      textStyle: Theme.of(context).textTheme.subtitle1,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
          widget.fun(value);
        });
      },
    );
  }
}
