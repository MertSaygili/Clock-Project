import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'custom_icon_button.dart';

class CustomStackDivider extends StatefulWidget {
  const CustomStackDivider({super.key});

  @override
  State<CustomStackDivider> createState() => _CustomStackDividerState();
}

class _CustomStackDividerState extends State<CustomStackDivider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _customDivider(context),
        _closeButton(),
      ],
    );
  }

  Padding _customDivider(BuildContext context) {
    double indentSize = 0.2;
    double paddingRatio = 2.5;
    return Padding(
      padding: PaddingItems().paddingTopOnly / paddingRatio * indentSize,
      child: Divider(
        color: AllColors().colorGrey,
        thickness: 2,
        endIndent: MediaQuery.of(context).size.width * indentSize,
        indent: MediaQuery.of(context).size.width * (indentSize / paddingRatio),
      ),
    );
  }

  Positioned _closeButton() {
    double five = 5;
    double height = 20;
    return Positioned(
      right: five,
      top: five * -1.5,
      height: height,
      child: CustomIconButton(icon: IconItems().closeIcon, fun: _closeSheet),
    );
  }

  void _closeSheet() => Navigator.of(context).pop<String>('false');
}
