import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_appbar.dart';
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
  //todo:: add card dynimacly exct

  final DateFormat _dateFormat = DateFormat('Hms');
  late String _now;
  late final Timer _everySecond;

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
