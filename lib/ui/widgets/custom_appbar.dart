import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/constants.dart';
import 'custom_icon_button.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    required this.isScrolled,
    required this.title,
    required this.prefferedSize,
    this.addFun,
    this.settingsFun,
  }) : super(key: key);

  final Function? addFun;
  final Function? settingsFun;
  final bool isScrolled;
  final String title;
  final double prefferedSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(prefferedSize);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final AllColors _colors = AllColors();
  final IconItems _icons = IconItems();
  final double elevation = 10;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final EdgeInsets paddingTop = EdgeInsets.only(top: height * 0.12);

    return AppBar(
      toolbarHeight: height * 0.35,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: _colors.colorWhite,
      elevation: elevation,
      titleTextStyle: Theme.of(context).textTheme.headline1,
      title: SizedBox(
        height: height * 0.34,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _title(paddingTop),
            _iconRow(),
          ],
        ),
      ),
    );
  }

  Padding _title(EdgeInsets paddingTop) {
    return Padding(
      padding: paddingTop,
      child: Text(widget.isScrolled ? widget.title : ''),
    );
  }

  Row _iconRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomIconButton(icon: _icons.addIcon, fun: widget.addFun),
        CustomIconButton(icon: _icons.settingsIcon, fun: null)
      ],
    );
  }
}
