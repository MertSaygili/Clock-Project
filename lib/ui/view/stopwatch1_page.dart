// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../time/time.dart';
import '../widgets/custom_timer_appbar.dart';

class StopwatchPageView1 extends StatefulWidget {
  const StopwatchPageView1({Key? key}) : super(key: key);

  @override
  State<StopwatchPageView1> createState() => _StopwatchPageView1State();
}

class _StopwatchPageView1State extends State<StopwatchPageView1> with Time {
  // late variables
  late Color _turButtonColor;
  late bool _isClicked;
  late String _textCurrentButtonFirst;
  late String _textCurrentButtonSecond;
  late String _textTime;

  // Timer variables
  late final Timer _everySplitsecond;
  late int _splitsecond;
  late int _second;
  late int _minute;

  // text variables
  final String _textTur = 'Tur';
  final String _textBaslangic = 'Baslangic';
  final String _textDur = 'Dur';
  final String _textSifirla = 'Sifirla';
  final String _textSurdur = 'Surdur';

  final double _prefferedSize = 50;

  @override
  void initState() {
    super.initState();
    _setPage();
  }

  @override
  void dispose() {
    super.dispose();
    disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSettingsAppBar(prefferedSize: _prefferedSize),
      body: _body(context),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _mainText(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _customButtonOne(),
            _customButtonSecond(),
          ],
        )
      ],
    );
  }

  Align _mainText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        _textTime,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  ElevatedButton _customButtonSecond() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (!_isClicked) {
            updateTime(); // kullanici baslata basti
            _isClicked = true;
            _textCurrentButtonSecond = _textDur;
          } else {
            // kullanici durdura basti
            _textCurrentButtonSecond = _textSurdur;
            _textCurrentButtonFirst = _textSifirla;
            _turButtonColor = AllColors().colorRed;
          }

          if (_textCurrentButtonSecond.compareTo(_textSurdur) == 0) {
            // kullanici surdure basti
            //todo:: keep increasUPing the timer
          }
        });
      },
      child: Text(_textCurrentButtonSecond),
    );
  }

  ElevatedButton _customButtonOne() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _turButtonColor),
      onPressed: _isClicked
          ? () {
              setState(() {
                // kullanici tur almak istedi
                if (_textCurrentButtonFirst.compareTo(_textTur) == 0) {
                  //todo: tur alma scaffold degisme gibi durumlar
                } else {
                  // kullanici sayfayi sifirladi
                  //todo: find how to refresh page
                  _setPage();
                }
              });
            }
          : null,
      child: Text(_textCurrentButtonFirst),
    );
  }

  void _setPage() {
    _textTime = '00:00:00';
    _isClicked = false;
    _textCurrentButtonFirst = _textTur;
    _textCurrentButtonSecond = _textBaslangic;
    _turButtonColor = AllColors().colorGrey;
    _splitsecond = 0;
    _second = 0;
    _minute = 0;
  }

  // current time functions
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

    _textTime = buffer.toString();
    buffer.clear();
  }

  @override
  updateTime() {
    _everySplitsecond =
        Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
      setState(() {
        setTime();
      });
    });
  }

  @override
  disposeTimer() {
    _everySplitsecond.cancel();
  }
}
