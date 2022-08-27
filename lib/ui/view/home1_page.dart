import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/view/stopwatch_page.dart';
import 'package:flutter/material.dart';

import 'clock_page.dart';

const int _currentIndex = 0;

class Home1PageView extends StatefulWidget {
  const Home1PageView({Key? key}) : super(key: key);

  @override
  State<Home1PageView> createState() => _Home1PageViewState();
}

class _Home1PageViewState extends State<Home1PageView> {
  late final PageController _controller;

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
    print(index);
    setState(() => index = _currentIndex);
  }
}

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
    setState(() => _currentIndex = index);

    widget.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }
}
