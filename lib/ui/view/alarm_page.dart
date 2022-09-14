import 'package:clock_project/service/shared/shared_manager.dart';
import 'package:clock_project/ui/widgets/custom_alarm_card.dart';
import 'package:clock_project/ui/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class AlarmPageView extends StatefulWidget {
  const AlarmPageView({Key? key}) : super(key: key);

  @override
  State<AlarmPageView> createState() => _AlarmPageViewState();
}

class _AlarmPageViewState extends State<AlarmPageView> {
  late final SharedManager _sharedManager;
  late final List<String> _titles;
  late final List<String> _clocks;
  late String _text;
  final String textUnactiveAlarm = 'Tum alarmlar kapali';
  bool isAlarmOn = true;

  @override
  void initState() {
    super.initState();
    _setSharedManager();
  }

  void _setSharedManager() {
    _sharedManager = SharedManager();
    _sharedManager.init();
    _titles = _sharedManager.getStringList(SharedKeys.titles);
    _clocks = _sharedManager.getStringList(SharedKeys.clocks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isScrolled: isAlarmOn,
        title: textUnactiveAlarm,
        prefferedSize: MediaQuery.of(context).size.height * 0.35,
        addFun: _showDialog,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return const CustomAlarmCard(
          title: 'Sabah Alarmi',
          subtitle: '18.20',
        );
      }),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialogs(context).clockDialog(_setInput);
        });
  }

  void _setInput(String value) => setState(() => _text = value);
}
