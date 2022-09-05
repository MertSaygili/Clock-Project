// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/time/time.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_icon_button.dart';
import '../widgets/custom_timer_appbar.dart';

class StopwatchPageView extends StatelessWidget {
  const StopwatchPageView({Key? key}) : super(key: key);

  final double _prefferedSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSettingsAppBar(
        prefferedSize: _prefferedSize,
        customIconButton: CustomIconButton(
          icon: IconItems().settingsIcon,
          fun: null,
        ),
      ),
      body: const _Body(),
    );
  }
}

// body class
class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with Time {
  late Timer _everyTenMilisecond;
  int _splitsecond = 0;
  int _second = 0;
  int _minute = 0;

  String _time = '00:00:00';
  String _currentFirstButtonText = ButtonText().textTur;
  String _currentSecondButtonText = ButtonText().textBaslat;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _customText(context),
        _buttonRow(_currentFirstButtonText, _currentSecondButtonText)
      ],
    );
  }

  // text of time
  Align _customText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(_time, style: Theme.of(context).textTheme.headline1),
    );
  }

  // button row
  Row _buttonRow(String firstButtonText, String secondButtonText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _customButton(
          firstButtonText,
          AllColors().colorGrey,
          false, // for determine that which button is which
        ),
        _customButton(
          secondButtonText,
          null,
          true,
        ),
      ],
    );
  }

  void _firstButtonAction() {
    setState(() {
      if (_isClicked) {
        // user has pressed 'baslat' button
        if (_currentFirstButtonText.compareTo(ButtonText().textTur) == 0) {
          // new scaffold -> tur
        } else {
          // user has clicked 'Sifirla'
          disposeTimer();
          _time = '00:00:00';
          _currentSecondButtonText = ButtonText().textBaslat;
          _currentFirstButtonText = ButtonText().textTur;
          _isClicked = false;
          _splitsecond = 0;
          _second = 0;
          _minute = 0;
        }
      }
      // user has not pressed 'baslat' button
      // do nothing
    });
  }

  void _secondButtonAction() {
    setState(() {
      if (_currentSecondButtonText.compareTo(ButtonText().textBaslat) == 0) {
        _currentSecondButtonText = ButtonText().textDur;
        _isClicked = true;
        updateTime();
        // start stopwatch
      } else if (_currentSecondButtonText.compareTo(ButtonText().textDur) ==
          0) {
        // stop stopwatch
        disposeTimer();
        _currentFirstButtonText = ButtonText().textSifirla;
        _currentSecondButtonText = ButtonText().textSurdur;
      } else if (_currentSecondButtonText.compareTo(ButtonText().textSurdur) ==
          0) {
        // keep increasing time
        updateTime();
        _currentFirstButtonText = ButtonText().textTur;
        _currentSecondButtonText = ButtonText().textDur;
      }
    });
  }

  ElevatedButton _customButton(String text, Color? color, bool check) {
    if (color != null) {
      if (_currentFirstButtonText.compareTo(ButtonText().textSifirla) == 0) {
        color = AllColors().colorRed;
      } else {
        color = AllColors().colorGrey;
      }
    }
    return ElevatedButton(
      onPressed: check // determine that which button is it
          ? () {
              _secondButtonAction();
            }
          : _isClicked // has user clicked 'baslat' button
              ? () {
                  _firstButtonAction();
                }
              : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AllColors().colordeepPurpleAccent,
      ),
      child: Text(text),
    );
  }

  // Time interface @override functions
  @override
  disposeTimer() {
    _everyTenMilisecond.cancel();
  }

  @override
  setTime() {
    var buffer = StringBuffer();
    // ms
    if (_splitsecond == 99) {
      _second = _second + 1;
      _splitsecond = 0;
    } else {
      _splitsecond = _splitsecond + 1;
    }

    // s
    if (_second == 59) {
      _minute = _minute + 1;
      _second = 0;
    }

    // m
    if (_minute < 10) {
      buffer.write('0$_minute:');
    } else {
      buffer.write('$_minute:');
    }

    // s
    if (_second < 10) {
      buffer.write('0$_second:');
    } else {
      buffer.write('$_second:');
    }

    // ms
    if (_splitsecond < 10) {
      buffer.write('0$_splitsecond');
    } else {
      buffer.write('$_splitsecond');
    }

    _time = buffer.toString();
    buffer.clear();
  }

  @override
  updateTime() {
    _everyTenMilisecond =
        Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
      setState(() {
        setTime();
      });
    });
  }
}

// button text
class ButtonText {
  final String textTur = 'Tur';
  final String textBaslat = 'Baslat';
  final String textDur = 'Dur';
  final String textSurdur = 'Surdur';
  final String textSifirla = 'Sifirla';
}
