// ignore_for_file: constant_identifier_names

import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/view/clock_page.dart';
import 'package:clock_project/ui/view/stopwatch_page.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late final PageController _controller;
  final String _textAlarm = 'Alarm';
  final String _textSaat = 'Saat';
  final String _textKronometre = 'Kronometre';
  final String _textZamanlayici = 'Zamanlayici';
  final double _elevation = 20;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: _tabBarView(),
    );
  }

  PageView _tabBarView() {
    return PageView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: _setNewPage,
      children: const [
        Text('sss'),
        ClockPageView(),
        StopWatchPageView(),
        Text('asdas'),
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: Theme.of(context).textTheme.headline3,
      selectedLabelStyle: Theme.of(context).textTheme.headline3?.copyWith(
            decoration: TextDecoration.underline,
            decorationThickness: 2,
          ),
      onTap: _onTap,
      items: [
        _bottomNavigationBarItem(_textAlarm),
        _bottomNavigationBarItem(_textSaat),
        _bottomNavigationBarItem(_textKronometre),
        _bottomNavigationBarItem(_textZamanlayici),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String text) {
    return BottomNavigationBarItem(
      label: text,
      icon: IconItems().nullIcon,
    );
  }

  void _onTap(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }

  void _setNewPage(int index) {
    setState(() => _currentIndex = index);
  }
}
