import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class AlarmPageView extends StatefulWidget {
  const AlarmPageView({Key? key}) : super(key: key);

  @override
  State<AlarmPageView> createState() => _AlarmPageViewState();
}

class _AlarmPageViewState extends State<AlarmPageView> {
  final String textUnactiveAlarm = 'Tum alarmlar kapali';
  bool isAlarmOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isScrolled: isAlarmOn,
        title: textUnactiveAlarm,
        prefferedSize: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }
}