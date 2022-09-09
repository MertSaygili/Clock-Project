// ignore_for_file: depend_on_referenced_packages

import 'package:clock_project/ui/view/timer_stopwatch_page.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_timer_appbar.dart';
import '../widgets/custom_timercolumn.dart';

class TimerPageView extends StatefulWidget {
  const TimerPageView({Key? key}) : super(key: key);

  @override
  State<TimerPageView> createState() => _TimerPageViewState();
}

class _TimerPageViewState extends State<TimerPageView> {
  final double _prefferedSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSettingsAppBar(
        prefferedSize: _prefferedSize,
        customIconButton:
            CustomIconButton(icon: IconItems().addIcon, fun: null),
        customIconButton2:
            CustomIconButton(icon: IconItems().settingsIcon, fun: null),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  List<int> timeVal = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTimerColumn(
              text: Texts().textSaat,
              minValue: 0,
              maxValue: 99,
              funs: [setHour, setMinute, setSecond],
            ),
            CustomTimerColumn(
              text: Texts().textDakika,
              minValue: 0,
              maxValue: 59,
              funs: [setHour, setMinute, setSecond],
            ),
            CustomTimerColumn(
              text: Texts().textSaniye,
              minValue: 0,
              maxValue: 59,
              funs: [setHour, setMinute, setSecond],
            ),
          ],
        ),
        _CustomElevatedButton(timeVal: timeVal),
      ],
    );
  }

  void setHour(int val) {
    setState(() {
      timeVal[0] = val;
    });
  }

  void setMinute(int val) {
    setState(() {
      timeVal[1] = val;
    });
  }

  void setSecond(int val) {
    setState(() {
      timeVal[2] = val;
    });
  }
}

class _CustomElevatedButton extends StatefulWidget {
  const _CustomElevatedButton({
    Key? key,
    required this.timeVal,
  }) : super(key: key);

  final List<int> timeVal;

  @override
  State<_CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<_CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _checkTimeValues()
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TimerStopwatchPV(
                          hour: widget.timeVal[0],
                          minute: widget.timeVal[1],
                          second: widget.timeVal[2],
                        )),
              );
            },
      child: Text(Texts().textBaslat),
    );
  }

  bool _checkTimeValues() {
    if (widget.timeVal[0] == 0 &&
        widget.timeVal[1] == 0 &&
        widget.timeVal[2] == 0) {
      return true;
    }
    return false;
  }
}
