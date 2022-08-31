// ignore_for_file: prefer_final_fields

import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StopwatchPageView extends StatefulWidget {
  const StopwatchPageView({Key? key}) : super(key: key);

  @override
  State<StopwatchPageView> createState() => _StopwatchPageViewState();
}

class _StopwatchPageViewState extends State<StopwatchPageView> {
  Color _turButtonColor = AllColors().colorGrey;
  bool _isClicked = false;
  late String _textCurrentButtonFirst;
  late String _textCurrentButtonSecond;
  String _textTime = '00:00:00';
  final String _textTur = 'Tur';
  final String _textBaslangic = 'Baslangic';
  final String _textDur = 'Dur';
  final String _textSifirla = 'Sifirla';
  final String _textSurdur = 'Surdur';

  @override
  void initState() {
    super.initState();
    _textCurrentButtonFirst = _textTur;
    _textCurrentButtonSecond = _textBaslangic;
  }

  String _stopWatch() {
    return 's';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AllColors().colorWhite,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [CustomIconButton(icon: IconItems().settingsIcon, fun: null)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              _textTime,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: _turButtonColor),
                onPressed: _isClicked
                    ? () {
                        setState(() {
                          if (_textCurrentButtonFirst.compareTo(_textTur) ==
                              0) {
                            //todo: tur alma scaffold degisme gibi durumlar
                          } else {
                            _resetPage();
                          }
                        });
                      }
                    : null,
                child: Text(_textCurrentButtonFirst),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (!_isClicked) {
                      _isClicked = true;
                      _textCurrentButtonSecond = _textDur;
                    } else {
                      _textCurrentButtonSecond = _textSurdur;
                      _textCurrentButtonFirst = _textSifirla;
                      _turButtonColor = AllColors().colorRed;
                    }
                  });
                },
                child: Text(_textCurrentButtonSecond),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _resetPage() {
    _textTime = '00:00:00';
    _isClicked = false;
    _textCurrentButtonFirst = _textTur;
    _textCurrentButtonSecond = _textBaslangic;
    _turButtonColor = AllColors().colorGrey;
  }
}
