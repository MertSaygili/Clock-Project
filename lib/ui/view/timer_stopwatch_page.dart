// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'dart:async';

import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_progress_bar_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  final String _textClear = 'Sifirla';
  final String _textDur = 'Dur';
  final String _textSurdur = 'Surdur';

  late Timer _everySecond;
  late final _increaseAmount;
  late int _totalTime;
  late String _nextTime;
  late String _textTemp;

  final DateFormat _dateFormat = DateFormat('Hms');
  final double _prefferedSize = 50;

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
    _textTemp = _textDur;
    _calculateTotalTime();
    _calculateNextTime();
    _calculateIncreaseAmount();
    setTime();
    updateTime();
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
          CustomProgressBar(
            time: _totalTime,
            percent: _currentPercent,
            clickTime: _everyClick,
            nextTime: _nextTime,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AllColors().colorRed,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(_textClear),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_textTemp.compareTo(_textDur) == 0) {
                      disposeTimer();
                      _textTemp = _textSurdur;
                    } else {
                      updateTime();
                      _textTemp = _textDur;
                    }
                  });
                },
                child: Text(_textTemp),
              ),
            ],
          )
        ],
      ),
    );
  }

  // calculate time functions
  void _calculateTotalTime() {
    _totalTime = widget.hour * 3600 + widget.minute * 60 + widget.second;
  }

  void _calculateNextTime() {
    String now = _dateFormat.format(DateTime.now()).toString();
    List<String> hms = now.split(':');

    int second = 0;
    int minute = 0;
    int hour = 0;

    if (int.parse(hms[2]) + widget.second >= 60) {
      second = int.parse(hms[2]) + widget.second - 60;
      minute = 1;
    }
    second = int.parse(hms[2]) + widget.second;

    if (int.parse(hms[1]) + widget.minute >= 60) {
      minute += int.parse(hms[1]) + widget.minute - 60;
      hour = 1;
    }
    minute += int.parse(hms[1]) + widget.minute;

    if (int.parse(hms[0]) + widget.hour >= 24) {
      hour += int.parse(hms[0]) + widget.hour - 24;
    }
    hour += int.parse(hms[0]) + widget.hour;

    _nextTime = '$hour:$minute:$second';
  }

  void _calculateIncreaseAmount() => _increaseAmount = 100 / _totalTime;

  // Time interface functions
  //todo:: show alert after time is over!
  @override
  disposeTimer() {
    _everySecond.cancel();
  }

  @override
  setTime() async {
    _currentPercent = 1.0 - (_increaseAmount * _everyClick) / 100;
    _everyClick++;

    if (_everyClick == _totalTime + 1) {
      disposeTimer();
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
