import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import '../../constants/constants.dart';
import '../../time/time_zones.dart';
import '../widgets/custom_clock_card.dart';
import '../widgets/custom_icon_button.dart';

class ClockPageView extends StatefulWidget {
  const ClockPageView({Key? key}) : super(key: key);

  @override
  State<ClockPageView> createState() => _ClockPageViewState();
}

class _ClockPageViewState extends State<ClockPageView> with Time {
  //todo:: add card dynimacly exct
  late final String location;
  late final Timer _everySecond;
  late String _now;

  final TimeZones timeZones = TimeZones();
  final DateFormat _dateFormat = DateFormat('Hms');

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
        addFun: _takeLocation,
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

  // functions
  void _takeLocation() {
    location = _customModalBottomSheet();
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

  String _customModalBottomSheet() {
    double bR = 15; // borderRadius
    double elevation = 15;
    String currentValue = timeZones.getLocations().first;

    void close() {
      Navigator.pop(context);
    }

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(bR))),
        isDismissible: false,
        isScrollControlled: true,
        elevation: elevation,
        context: context,
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: CustomIconButton(
                      icon: IconItems().closeIcon,
                      fun: close,
                    ),
                  ),
                ),
                DropdownButton<String>(
                    menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
                    value: TimeZones().getLocations().first,
                    items: TimeZones()
                        .getLocations()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: currentValue,
                        child: Text(
                          value,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      currentValue = value ?? '';
                    }),
              ],
            ),
          );
        });

    return 'x';
  }
}
