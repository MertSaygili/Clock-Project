// ignore_for_file: unused_field

import 'dart:async';
import 'package:clock_project/time/time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPageView extends StatefulWidget {
  const ClockPageView({Key? key}) : super(key: key);

  @override
  State<ClockPageView> createState() => _ClockPageViewState();
}

class _ClockPageViewState extends State<ClockPageView> with Time {
  final DateFormat f = DateFormat('Hms');
  late String _now;
  late Timer _everySecond;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(_now),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setTime();
    updateTime();
  }

  @override
  setTime() {
    _now = f.format(DateTime.now()).toString();
  }

  @override
  updateTime() {
    _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        setTime();
      });
    });
  }
}
