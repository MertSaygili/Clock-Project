import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/view/stopwatch_page.dart';
import 'package:flutter/material.dart';

import 'clock_page.dart';

class Home1PageView extends StatefulWidget {
  const Home1PageView({Key? key}) : super(key: key);

  @override
  State<Home1PageView> createState() => _Home1PageViewState();
}

class _Home1PageViewState extends State<Home1PageView> {
  late final PageController _controller;
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        controller: _controller,
        currentIndex: _currentIndex,
      ),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: _setNewPage,
        children: const [
          Text('sss'),
          ClockPageView(),
          StopWatchPageView(),
          Text('asdas'),
        ],
      ),
    );
  }

  void _setNewPage(int index) {
    setState(() => index = _currentIndex);
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {Key? key, required this.controller, required this.currentIndex})
      : super(key: key);

  final PageController controller;
  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final String _textAlarm = 'Alarm';
  final String _textSaat = 'Saat';
  final String _textKronometre = 'Kronometre';
  final String _textZamanlayici = 'Zamanlayici';

  @override
  Widget build(BuildContext context) {
    final AllColors _colors = AllColors();
    final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: _colors.colorTransparent,
      selectedItemColor: _colors.colorBlack,
      unselectedItemColor: _colors.colorGrey,
      selectedLabelStyle: textTheme.headline3,
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
    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }
}
