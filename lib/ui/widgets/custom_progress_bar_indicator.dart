import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomProgressBarIndicator extends StatelessWidget {
  const CustomProgressBarIndicator({super.key, required this.time});
  final int time;

  @override
  Widget build(BuildContext context) {
    final double radius = MediaQuery.of(context).size.width / 4;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircularPercentIndicator(
            radius: radius,
          ),
        ],
      ),
    );
  }
}
