import 'package:clock_project/service/shared/shared_manager.dart';
import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_appbar.dart';
import 'package:clock_project/ui/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import '../../time/time_zones.dart';
import '../widgets/custom_clock_card.dart';

class ClockPageView extends StatefulWidget {
  const ClockPageView({Key? key}) : super(key: key);

  @override
  State<ClockPageView> createState() => _ClockPageViewState();
}

class _ClockPageViewState extends State<ClockPageView> with Time {
  late final SharedManager _sharedManager;
  late final Timer _everySecond;
  late List<String> _countries;
  late List<String> _times;
  late String _now;
  final DateFormat _dateFormat = DateFormat('Hms');

  @override
  void initState() {
    super.initState();
    _setSharedManager();
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
      body: ListView.builder(
          itemCount: _countries.length,
          itemBuilder: (context, index) {
            return CustomClockCard(
              title: _countries[index],
              information: 'Yerel saat',
              clock: _times[index],
            );
          }),
    );
  }

  _bottomSheet() async {
    double bRadius = 15;
    double elevation = 15;

    var result = await showModalBottomSheet(
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: false,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(bRadius))),
        context: context,
        builder: (context) {
          return const CustomSheet(size: 0.5);
        });

    if (result.toString().compareTo('') != 0) {
      final List<String> tempCountries = _countries;
      tempCountries.add(result);
      _sharedManager.setStringList(SharedKeys.countries, tempCountries);

      final List<String> times = _times;
      times.add(TimeZones().getTimeOfLocation(result));
      _sharedManager.setStringList(SharedKeys.times, times);
    }
  }

  void _setSharedManager() {
    _sharedManager = SharedManager();
    _sharedManager.init();
    _countries = _sharedManager.getStringList(SharedKeys.countries);
    _times = _sharedManager.getStringList(SharedKeys.times);
  }

  // current time functions
  @override
  setTime() {
    _now = _dateFormat.format(DateTime.now()).toString();
    for (var i = 0; i < _times.length; i++) {
      _times[i] = TimeZones().getTimeOfLocation(_countries[i]);
    }
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
