// ignore_for_file: unused_field

import 'dart:async';
import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_card.dart';
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
  void dispose() {
    super.dispose();
    disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: _paddignItems.paddingScreen,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ListView(
                children: [
                  Padding(
                    padding: _paddignItems.paddingTimer,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _now,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: IconItems().addIcon,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: IconItems().settingsIcon,
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: PaddignItems().paddingCard,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return const CustomCard(
                      title: 'Sabah alarmi',
                      clock: '18:20',
                      days: ['Persembe', 'Cuma'],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
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

  @override
  disposeTimer() {
    _everySecond.cancel();
  }
}
