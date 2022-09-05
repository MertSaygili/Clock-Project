import 'dart:async';

import 'package:clock_project/time/time.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({super.key, required this.time});
  final int time;

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> with Time {
  late final Timer _everySecond;
  late final _increaseAmount;
  final double _lineWidth = 10;

  int _everyClick = 0;
  double _currentPercent = 1;

  @override
  void initState() {
    super.initState();
    _increaseAmount = 100 / widget.time;

    setTime();
    updateTime();
  }

  @override
  void dispose() {
    super.dispose();
    disposeTimer();
  }

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
            percent: _currentPercent,
            center: Text(
              '${widget.time - _everyClick}',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }

  @override
  disposeTimer() {
    _everySecond.cancel();
  }

  @override
  setTime() {
    _everyClick++;
    _currentPercent = 1.0 - (_increaseAmount * _everyClick) / 100;

    if (_everyClick == widget.time) {
      disposeTimer();
      //todo: show dialog box
    }
  }

  @override
  updateTime() {
    _everySecond = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        setTime();
      });
    });
  }
}
