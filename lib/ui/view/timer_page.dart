// ignore_for_file: depend_on_referenced_packages

import 'package:clock_project/ui/view/timer_stopwatch_page.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_timer_appbar.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerPageView extends StatefulWidget {
  const TimerPageView({Key? key}) : super(key: key);

  @override
  State<TimerPageView> createState() => _TimerPageViewState();
}

class _TimerPageViewState extends State<TimerPageView> {
  //todo:: zamani al ve elevated button icinde kullan
  final double _prefferedSize = 50;
  List<int> timeVal = [0, 0, 0];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _TimerColumn(
                text: Texts().textSaat,
                minValue: 0,
                maxValue: 99,
                funs: [setHour, setMinute, setSecond],
              ),
              _TimerColumn(
                text: Texts().textDakika,
                minValue: 0,
                maxValue: 59,
                funs: [setHour, setMinute, setSecond],
              ),
              _TimerColumn(
                text: Texts().textSaniye,
                minValue: 0,
                maxValue: 59,
                funs: [setHour, setMinute, setSecond],
              ),
            ],
          ),
          //todo:: elevated buttonu widget olarak cikar islemleri orada yap
          _CustomElevatedButton(timeVal: timeVal),
        ],
      ),
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
                    builder: (context) => TimerStopwatchPageView(
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

class _TimerColumn extends StatefulWidget {
  const _TimerColumn({
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
  State<_TimerColumn> createState() => _TimerColumnState();
}

class _TimerColumnState extends State<_TimerColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _Text(text: widget.text),
        _NumberPicker(
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

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class _NumberPicker extends StatefulWidget {
  const _NumberPicker({
    Key? key,
    required this.fun,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  final Function fun;
  final int minValue;
  final int maxValue;

  @override
  State<_NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<_NumberPicker> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      step: 1,
      itemCount: 3,
      selectedTextStyle: Theme.of(context).textTheme.caption,
      textStyle: Theme.of(context).textTheme.subtitle1,
      minValue: widget.minValue,
      maxValue: widget.maxValue,
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value;
          widget.fun(value);
        });
      },
    );
  }
}

class Texts {
  final String textSaat = 'Saat';
  final String textDakika = 'Dakika';
  final String textSaniye = 'Saniye';
  final String textBaslat = 'Baslat';
}
