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
  late List<String> _titles;
  late List<String> _clocks;
  late String _text;
  final String textUnactiveAlarm = 'Tum alarmlar kapali';
  bool isAlarmOn = true;
  List<int> _timeVal = [0, 0];

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
      body: ListView.builder(
          itemCount: _titles.length,
          itemBuilder: (context, index) {
            return CustomAlarmCard(
              title: _titles[index],
              subtitle: _clocks[index],
            );
          }),
    );
  }

  void _showDialog() async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialogs(context).clockDialog(_setInput, [
            setHour,
            setMinute,
          ]);
        });

    if (_text != '' && result) {
      _clocks.add(_setTime());
      _titles.add(_text);
      _sharedManager.setStringList(SharedKeys.clocks, _clocks);
      _sharedManager.setStringList(SharedKeys.titles, _titles);

      _timeVal = [0, 0];
    }
  }

  String _setTime() {
    String clock = _timeVal[0].toString();
    String minute = _timeVal[1].toString();
    if (_timeVal[0] < 10) {
      clock = '0$clock';
    }

    if (_timeVal[1] < 10) {
      minute = '0$minute';
    }

    return '$clock:$minute';
  }

  void _setInput(String value) => setState(() => _text = value);

  void setHour(int val) {
    setState(() {
      _timeVal[0] = val;
    });
  }

  void setMinute(int val) {
    setState(() {
      _timeVal[1] = val;
    });
  }
}
