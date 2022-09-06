import 'package:clock_project/ui/widgets/custom_alarm_card.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class AlarmPageView extends StatefulWidget {
  const AlarmPageView({Key? key}) : super(key: key);

  @override
  State<AlarmPageView> createState() => _AlarmPageViewState();
}

class _AlarmPageViewState extends State<AlarmPageView> {
  //todo:: add card dynimacly exct
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
      body: ListView.builder(itemBuilder: (context, index) {
        return const CustomAlarmCard(
          title: 'Sabah Alarmi',
          subtitle: '18.20',
        );
      }),
    );
  }
}
