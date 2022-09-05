// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:clock_project/constants/constants.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({
    Key? key,
    required this.time,
    required this.clickTime,
    required this.nextTime,
    required this.percent,
  }) : super(key: key);

  final int time;
  final int clickTime;
  final String nextTime;
  final double percent;

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  final double _lineWidth = 10;

  @override
  Widget build(BuildContext context) {
    final double radius = MediaQuery.of(context).size.width / 3;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircularPercentIndicator(
            radius: radius,
            lineWidth: _lineWidth,
            percent: widget.percent,
            progressColor: AllColors().colordeepPurpleAccent,
            backgroundColor: AllColors().colorRed,
            center: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Center(
                    child: Text(
                      '${widget.time - widget.clickTime + 1}',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    widget.nextTime,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
