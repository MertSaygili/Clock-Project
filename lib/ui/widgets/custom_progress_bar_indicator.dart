import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({super.key, required this.time});
  final int time;

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
          ),
        ],
      ),
    );
  }
}
