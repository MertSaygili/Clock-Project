import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final String _textAlarm = 'Alarm';
  final String _textSaat = 'Saat';
  final String _textKronometre = 'Kronometre';
  final String _textZamanlayici = 'Zamanlayici';
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AllColors colors = AllColors();
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      currentIndex: _currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: colors.colorTransparent,
      selectedItemColor: colors.colorBlack,
      unselectedItemColor: colors.colorGrey,
      selectedLabelStyle: textTheme.headline3?.copyWith(
        decoration: TextDecoration.underline,
        decorationThickness: 2,
      ),
      unselectedLabelStyle: textTheme.headline3,
      onTap: _onTap,
      items: [
        _bottomNavigationBarItem(null, _textAlarm),
        _bottomNavigationBarItem(null, _textSaat),
        _bottomNavigationBarItem(null, _textKronometre),
        _bottomNavigationBarItem(null, _textZamanlayici),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(Icon? icon, String text) {
    return BottomNavigationBarItem(
      icon: icon ?? IconItems().nullIcon,
      label: text,
    );
  }

  void _onTap(int index) {
    setState(() => _currentIndex = index);

    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }
}
