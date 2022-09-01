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

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final String _time = '00:00:00';
  final ButtonText _buttonText = ButtonText();

  final bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    String firstButtonText = _buttonText.textTur;
    String secondButtonText = _buttonText.textBaslat;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _customText(context),
        _buttonRow(firstButtonText, secondButtonText)
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

  Row _buttonRow(String firstButtonText, String secondButtonText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _customButton(
          firstButtonText,
          AllColors().colorGrey,
          _firstButtonAction,
          false, // for determine that which button is which
        ),
        _customButton(
          secondButtonText,
          null,
          _secondButtonAction,
          true,
        ),
      ],
    );
  }

  Function? _firstButtonAction() {}
  Function? _secondButtonAction() {}

  ElevatedButton _customButton(
      String text, Color? color, Function fun, bool check) {
    return ElevatedButton(
      onPressed: check
          ? () {}
          : _isClicked
              ? () {}
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
  final String textSifirla = 'Sifirla';
}
