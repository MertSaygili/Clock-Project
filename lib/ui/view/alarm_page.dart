import 'package:clock_project/service/shared/shared_manager.dart';
import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_alarm_card.dart';
import 'package:clock_project/ui/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';

class AlarmPageView extends StatefulWidget {
  const AlarmPageView({Key? key}) : super(key: key);

  @override
  State<AlarmPageView> createState() => _AlarmPageViewState();
}

class _AlarmPageViewState extends State<AlarmPageView> with Time {
  late final SharedManager _sharedManager;
  late List<String> _titles;
  late List<String> _clocks;
  late String _text;
  late String _title;

  final String _textUnactiveAlarm = 'Tum alarmlar kapali';
  final bool _isAlarmOn = true;

  List<int> _timeVal = [0, 0];

  @override
  void initState() {
    super.initState();
    _setSharedManager();
    _title = _textUnactiveAlarm;
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
        isScrolled: _isAlarmOn,
        title: _title,
        prefferedSize: MediaQuery.of(context).size.height * 0.35,
        addFun: _showDialog,
      ),
      body: ListView.builder(
          itemCount: _titles.length,
          itemBuilder: (context, index) {
            return CustomAlarmCard(
              title: _titles[index],
              subtitle: _clocks[index],
              fun: _updateTitle,
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

    if (result) {
      final List<String> tempClock = _clocks;
      tempClock.add(_setTime());
      _sharedManager.setStringList(SharedKeys.clocks, _clocks);

      final List<String> tempTitles = _titles;
      tempTitles.add(_text);
      _sharedManager.setStringList(SharedKeys.titles, _titles);

      _timeVal = [0, 0];

      setState(() {});
    }
  }

  void _updateTitle(bool change) {
    if (change) {
      setState(() {
        _title = 'Alarm aktif';
      });
    } else {
      setState(() {
        _title = _textUnactiveAlarm;
      });
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

  @override
  disposeTimer() {
    throw UnimplementedError();
  }

  @override
  setTime() {
    throw UnimplementedError();
  }

  @override
  updateTime() {
    throw UnimplementedError();
  }
}
