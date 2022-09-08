import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_appbar.dart';
import 'package:clock_project/ui/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import '../widgets/custom_clock_card.dart';

class ClockPageView extends StatefulWidget {
  const ClockPageView({Key? key}) : super(key: key);

  @override
  State<ClockPageView> createState() => _ClockPageViewState();
}

class _ClockPageViewState extends State<ClockPageView> with Time {
  late final Timer _everySecond;
  late String _now;
  final DateFormat _dateFormat = DateFormat('Hms');

  @override
  void initState() {
    super.initState();
    setTime();
    updateTime();
  }

  @override
  void dispose() {
    super.dispose();
    disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isScrolled: true,
        title: _now,
        prefferedSize: MediaQuery.of(context).size.height * 0.35,
        addFun: _bottomSheet,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const CustomClockCard(
          title: 'Istanbul',
          information: 'Yerel saat',
          clock: '18.20',
        );
      }),
    );
  }

  _bottomSheet() async {
    double bRadius = 15;
    double elevation = 15;

    final result = await showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: false,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(bRadius))),
        context: context,
        builder: (context) {
          return const CustomSheet(size: 0.6);
        });
  }

  // current time functions
  @override
  setTime() {
    _now = _dateFormat.format(DateTime.now()).toString();
  }

  @override
  updateTime() {
    _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        setTime();
      });
    });
  }

  @override
  disposeTimer() {
    _everySecond.cancel();
  }
}
