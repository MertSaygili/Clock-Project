// ignore_for_file: unused_field

import 'dart:async';
import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/time/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ClockPageView extends StatefulWidget {
  const ClockPageView({Key? key}) : super(key: key);

  @override
  State<ClockPageView> createState() => _ClockPageViewState();
}

class _ClockPageViewState extends State<ClockPageView> with Time {
  final DateFormat _dateFormat = DateFormat('Hms');
  final PaddignItems _paddignItems = PaddignItems();
  final double _elevation = 15;
  late String _now;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();
    setTime();
    updateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: _elevation,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height / 3,
        title: Text(
          _now,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.format_list_bulleted_outlined)),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: ((context, index) {
          return Text('S');
        }),
      ),
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
}
