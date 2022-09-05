// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_progress_bar_indicator.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_timer_appbar.dart';

class TimerStopwatchPV extends StatefulWidget {
  const TimerStopwatchPV({
    super.key,
    required this.hour,
    required this.minute,
    required this.second,
  });

  final int hour;
  final int minute;
  final int second;

  @override
  State<TimerStopwatchPV> createState() => _TimerStopwatchPVState();
}

class _TimerStopwatchPVState extends State<TimerStopwatchPV> with Time {
  late final Timer _everySecond;
  late final _increaseAmount;
  late int _totalTime;

  final double _prefferedSize = 50;

  final double _lineWidth = 10;

  int _everyClick = 0;
  double _currentPercent = 1;

  @override
  void dispose() {
    super.dispose();
    disposeTimer();
  }

  @override
  void initState() {
    super.initState();
    _totalTime = calculateTotalTime();
    _increaseAmount = 100 / _totalTime;
    setTime();
    updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomProgressBar(
            time: _totalTime,
            percent: _currentPercent,
            clickTime: _everyClick,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('click1')),
              ElevatedButton(onPressed: () {}, child: const Text('click2')),
            ],
          )
        ],
      ),
    );
  }

  CustomSettingsAppBar _appBar() {
    return CustomSettingsAppBar(
      prefferedSize: _prefferedSize,
      customIconButton: CustomIconButton(
        icon: IconItems().addIcon,
        fun: null,
      ),
      customIconButton2: CustomIconButton(
        icon: IconItems().settingsIcon,
        fun: null,
      ),
    );
  }

  int calculateTotalTime() {
    return widget.hour * 3600 + widget.minute * 60 + widget.second;
  }

  @override
  disposeTimer() {
    _everySecond.cancel();
  }

  @override
  setTime() {
    _everyClick++;
    _currentPercent = 1.0 - (_increaseAmount * _everyClick) / 100;

    if (_everyClick == _totalTime) {
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
