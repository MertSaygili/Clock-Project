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
  late final String _location;
  late final Timer _everySecond;
  late final Iterable<String> _locations;
  late String _currentValue;
  late String _now;

  final TimeZones _timeZones = TimeZones();
  final DateFormat _dateFormat = DateFormat('Hms');

  @override
  void initState() {
    super.initState();
    setTime();
    updateTime();
    _setLocations();
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
    _customModalBottomSheet();
  }

  void _setLocations() {
    _locations = _timeZones.getLocations();
    _currentValue = _locations.first;
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

    void close() {
      Navigator.pop(context);
    }

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(bR)),
        ),
        isDismissible: false,
        isScrollControlled: true,
        elevation: elevation,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
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
                  _dropDownButton(context),
                ],
              ),
            );
          });
        });

    return 'x';
  }

//todo:: currentValue'yu guncellemiyor --> mimari sikinti oldugunu dusunuyorum
  DropdownButton<String> _dropDownButton(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
      value: _currentValue,
      onChanged: (value) {
        setState(() {
          _currentValue = value.toString();
        });
      },
      items: _locations.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: Theme.of(context).textTheme.headline3,
          ),
        );
      }).toList(),
    );
  }
}
