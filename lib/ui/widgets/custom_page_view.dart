import 'package:clock_project/ui/view/alarm_page.dart';
import 'package:clock_project/ui/view/clock_page.dart';
import 'package:clock_project/ui/view/timer_page.dart';
import 'package:flutter/cupertino.dart';

import '../view/stopwatch_page.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({Key? key, required this.controller}) : super(key: key);
  final PageController controller;

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: _setNewPage,
      children: const [
        AlarmPageView(),
        ClockPageView(),
        StopwatchPageView(),
        TimerPageView(),
      ],
    );
  }

  void _setNewPage(int index) {
    setState(() => index = _currentIndex);
  }
}
