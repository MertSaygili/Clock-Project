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
  String _timeZoneName = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.size,
      child: Column(children: [
        _closeButton(),
        _customDivider(context),
        Padding(
          padding: PaddignItems().paddingTopOnly,
          child: CustomDropdownButton(fun: _setTimezone),
        )
      ]),
    );
  }

  Padding _customDivider(BuildContext context) {
    return Padding(
      padding: PaddignItems().paddingTopOnly,
      child: Divider(
        thickness: 2,
        endIndent: MediaQuery.of(context).size.width * 0.2,
        indent: MediaQuery.of(context).size.width * 0.2,
      ),
    );
  }

  Align _closeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: CustomIconButton(
        icon: IconItems().closeIcon,
        fun: _closeSheet,
      ),
    );
  }

  void _setTimezone(String newTimeZone) =>
      setState(() => _timeZoneName = newTimeZone);
  void _closeSheet() => Navigator.of(context).pop<String>('null');
}
