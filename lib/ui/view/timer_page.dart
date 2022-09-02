// ignore_for_file: depend_on_referenced_packages

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
  late int _hour;
  late int _minute;
  late int _second;

  final double _prefferedSize = 50;
  final String _textSaat = 'Saat';
  final String _textDakika = 'Dakika';
  final String _textSaniye = 'Saniye';
  final String _textBaslat = 'Baslat';

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
              _TimerColumn(text: _textSaat, minValue: 0, maxValue: 99),
              _TimerColumn(text: _textDakika, minValue: 0, maxValue: 59),
              _TimerColumn(text: _textSaniye, minValue: 0, maxValue: 59),
            ],
          ),
          //todo:: elevated buttonu widget olarak cikar islemleri orada yap
          ElevatedButton(onPressed: () {}, child: Text(_textBaslat)),
        ],
      ),
    );
  }

  void setTimeProperties(int hour, int minute, int second) {
    setState(() {
      _hour = hour;
      _minute = minute;
      _second = second;
    });
  }
}

class _TimerColumn extends StatefulWidget {
  const _TimerColumn({
    Key? key,
    required this.text,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  final String text;
  final int minValue;
  final int maxValue;

  @override
  State<_TimerColumn> createState() => _TimerColumnState();
}

class _TimerColumnState extends State<_TimerColumn> {
  late int timeVal;

  //todo:: zamani aldik ama hangisinin hangisi oldugu bilmiyoruz
  //! text'e sahip oldugumuz icin hangisinin hangisi oldugunu anlayabiliriz ama
  //! yeterli degil 3 farkli fonksiyon disinde tek fonks ile birtirmeye calis
  //! ayirma islemi burada gerceklesmeli
  void setTime(int val) {
    setState(() {
      timeVal = val;
    });
  }

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
