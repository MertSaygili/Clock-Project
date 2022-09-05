import 'package:clock_project/ui/widgets/custom_progress_bar_indicator.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_timer_appbar.dart';

class TimerStopwatchPageView extends StatefulWidget {
  const TimerStopwatchPageView({
    super.key,
    required this.hour,
    required this.minute,
    required this.second,
  });

  final int hour;
  final int minute;
  final int second;

  @override
  State<TimerStopwatchPageView> createState() => _TimerStopwatchPageViewState();
}

class _TimerStopwatchPageViewState extends State<TimerStopwatchPageView> {
  late int _totalTime;
  final double _prefferedSize = 50;

  @override
  void initState() {
    super.initState();
    _totalTime = calculateTotalTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSettingsAppBar(
        prefferedSize: _prefferedSize,
        customIconButton: CustomIconButton(
          icon: IconItems().addIcon,
          fun: null,
        ),
        customIconButton2: CustomIconButton(
          icon: IconItems().settingsIcon,
          fun: null,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomProgressBar(time: _totalTime),
          ElevatedButton(onPressed: () {}, child: const Text('click'))
        ],
      ),
    );
  }

  int calculateTotalTime() {
    return widget.hour * 3600 + widget.minute * 60 + widget.second;
  }
}
