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
  String _timeZoneName = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.size,
      child: Column(children: [
        Padding(
          padding: PaddignItems().paddingTopOnly,
          child: SizedBox(
            height: _sizedBoxHeight, // 40
            child: Stack(
              children: [
                _customDivider(context),
                _closeButton(),
              ],
            ),
          ),
        ),

        // _closeButton(),
        // _customDivider(context),
        Padding(
          padding: PaddignItems().paddingTopOnly,
          child: CustomDropdownButton(fun: _setTimezone),
        )
      ]),
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
        indent: MediaQuery.of(context).size.width * indentSize,
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
  void _setTimezone(String newTimeZone) => setState(() {
        _timeZoneName = newTimeZone;
      });
  void _closeSheet() => Navigator.of(context).pop<String>('null');
}
