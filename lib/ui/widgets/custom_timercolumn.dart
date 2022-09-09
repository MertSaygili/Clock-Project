import 'package:flutter/material.dart';

import 'custom_numberpicker.dart';

class CustomTimerColumn extends StatefulWidget {
  const CustomTimerColumn({
    Key? key,
    required this.text,
    required this.minValue,
    required this.maxValue,
    required this.funs,
  }) : super(key: key);

  final List<Function> funs;
  final String text;
  final int minValue;
  final int maxValue;

  @override
  State<CustomTimerColumn> createState() => _TimerColumnState();
}

class _TimerColumnState extends State<CustomTimerColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomText(text: widget.text),
        CustomNumberPicker(
          fun: setTime,
          minValue: widget.minValue,
          maxValue: widget.maxValue,
        ),
      ],
    );
  }

  void setTime(int val) {
    List<String> timeNames = [
      Texts().textSaat,
      Texts().textDakika,
      Texts().textSaniye
    ];
    setState(() {
      for (var i = 0; i < timeNames.length; i++) {
        if (widget.text.compareTo(timeNames[i]) == 0) {
          widget.funs[i](val);
          break;
        }
      }
    });
  }
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class Texts {
  final String textSaat = 'Saat';
  final String textDakika = 'Dakika';
  final String textSaniye = 'Saniye';
  final String textBaslat = 'Baslat';
}
