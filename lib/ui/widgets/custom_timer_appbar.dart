// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';
import 'custom_icon_button.dart';

class CustomSettingsAppBar extends StatefulWidget with PreferredSizeWidget {
  const CustomSettingsAppBar({
    Key? key,
    required this.prefferedSize,
    required this.customIconButton,
    this.customIconButton2,
    this.customIconButton3,
  }) : super(key: key);

  final prefferedSize;
  final CustomIconButton customIconButton;
  final CustomIconButton? customIconButton2;
  final CustomIconButton? customIconButton3;

  @override
  State<CustomSettingsAppBar> createState() => CustomSettingsAppBarState();
  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class CustomSettingsAppBarState extends State<CustomSettingsAppBar> {
  final double _elevation = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: _elevation,
      backgroundColor: AllColors().colorWhite,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: widget.customIconButton3,
      actions: [
        widget.customIconButton,
        widget.customIconButton2 ?? const SizedBox(),
      ],
    );
  }
}
