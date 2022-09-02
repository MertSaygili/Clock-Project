// ignore_for_file: prefer_final_fields

import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_timer_appbar.dart';

class StopwatchPageView extends StatelessWidget {
  const StopwatchPageView({Key? key}) : super(key: key);

  final double _prefferedSize = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSettingsAppBar(prefferedSize: _prefferedSize),
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

class _BodyState extends State<_Body> {
  final String _time = '00:00:00';
  Color? _firstButtonColor = AllColors().colorGrey;
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
        if (_currentSecondButtonText.compareTo(ButtonText().textDur) == 0) {
          // new scaffold -> tur
        } else {
          // _currentSecondButtonText.compareTo(ButtonText().textSurdur

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
        // start stopwatch
      } else if (_currentSecondButtonText.compareTo(ButtonText().textDur) ==
          0) {
        // stop stopwatch
        _currentFirstButtonText = ButtonText().textSifirla;
        _currentSecondButtonText = ButtonText().textSurdur;
        _firstButtonColor = AllColors().colorRed;
      } else if (_currentSecondButtonText.compareTo(ButtonText().textSurdur) ==
          0) {
        // keep increasing time
        _currentSecondButtonText = ButtonText().textDur;
      }
    });
  }

  ElevatedButton _customButton(String text, Color? color, bool check) {
    if (color != null) {
      color = _firstButtonColor;
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
        primary: color ?? AllColors().colordeepPurpleAccent,
      ),
      child: Text(text),
    );
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
