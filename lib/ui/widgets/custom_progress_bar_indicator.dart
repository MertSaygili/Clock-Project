// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({
    super.key,
    required this.time,
    required this.percent,
    required this.clickTime,
  });
  final int time;
  final double percent;
  final int clickTime;

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
            center: Text(
              '${widget.time - widget.clickTime + 1}',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
