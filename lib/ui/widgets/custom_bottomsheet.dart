import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'custom_dropdownbutton.dart';
import 'custom_icon_button.dart';

class CustomSheet extends StatefulWidget {
  const CustomSheet({super.key, required this.size});

  final double size;

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  final double _sizedBoxHeight = 40;
  final String _add = 'Ekle';
  String _timeZoneName = 'Africa/Abidjan';
  String _time = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.size,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _stack(context),
        CustomDropdownButton(fun: _setTimezone),
        _timeText(context),
        ElevatedButton(onPressed: () {}, child: Text(_add)),
      ]),
    );
  }

  Text _timeText(BuildContext context) {
    return Text(
      'Current time: $_time in ${_timeZoneName.split('/')[1]}',
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  SizedBox _stack(BuildContext context) {
    return SizedBox(
      height: _sizedBoxHeight, // 40
      child: Stack(
        children: [
          _customDivider(context),
          _closeButton(),
        ],
      ),
    );
  }

  Padding _customDivider(BuildContext context) {
    double indentSize = 0.2;
    double paddingRatio = 2.5;
    return Padding(
      padding: PaddignItems().paddingTopOnly / paddingRatio,
      child: Divider(
        color: AllColors().colorGrey,
        thickness: 2,
        endIndent: MediaQuery.of(context).size.width * indentSize,
        indent: MediaQuery.of(context).size.width * (indentSize / paddingRatio),
      ),
    );
  }

  Positioned _closeButton() {
    double zero = 0;
    double height = 30;
    return Positioned(
      right: zero,
      top: zero,
      height: height,
      child: CustomIconButton(icon: IconItems().closeIcon, fun: _closeSheet),
    );
  }

  // functions
  void _setTimezone(String timeZoneName, String time) => setState(() {
        _timeZoneName = timeZoneName;
        _time = time;
      });
  void _closeSheet() => Navigator.of(context).pop<String>('null');
}
