import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_appbar.dart';
import 'package:clock_project/ui/widgets/custom_icon_button.dart';
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
  //todo:: add card dynimacly exct
  late String _location;
  late final Timer _everySecond;
  late final Iterable<String> _locations;
  late String _currentValue;
  late String _now;
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
        addFun: _bottomSheet,
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

  // Functions
  _addLocation(String location) {
    setState(() {
      _location = location;
    });
  }

  _bottomSheet() async {
    double bRadius = 15;
    double elevation = 15;

    final result = await showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: false,
        elevation: elevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(bRadius))),
        context: context,
        builder: (context) {
          return const CustomSheet(size: 0.6);
        });
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

class CustomSheet extends StatefulWidget {
  const CustomSheet({super.key, required this.size});

  final double size;

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  String _timeZoneName = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.size,
      child: Column(children: [
        _closeButton(),
        _customDivider(context),
        Padding(
          padding: PaddignItems().paddingTopOnly,
          child: CustomDropdownButton(fun: _setTimezone),
        )
      ]),
    );
  }

  Padding _customDivider(BuildContext context) {
    return Padding(
      padding: PaddignItems().paddingTopOnly,
      child: Divider(
        thickness: 2,
        endIndent: MediaQuery.of(context).size.width * 0.2,
        indent: MediaQuery.of(context).size.width * 0.2,
      ),
    );
  }

  Align _closeButton() {
    return Align(
      alignment: Alignment.topRight,
      child: CustomIconButton(
        icon: IconItems().closeIcon,
        fun: _closeSheet,
      ),
    );
  }

  void _setTimezone(String newTimeZone) =>
      setState(() => _timeZoneName = newTimeZone);
  void _closeSheet() => Navigator.of(context).pop<String>('null');
}

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key, required this.fun});

  final Function fun;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  late final Iterable<String> _locations;
  final TimeZones _timeZones = TimeZones();

  late String _currentItem;

  @override
  void initState() {
    super.initState();
    _setLocations();
  }

  void _setLocations() {
    _locations = _timeZones.getLocations();
    _currentItem = _locations.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _currentItem,
      items: _locations.map((String val) {
        return DropdownMenuItem(
          value: val,
          child: Text(
            val,
            style: Theme.of(context).textTheme.headline3,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _currentItem = value.toString();
          widget.fun(_currentItem);
        });
      },
    );
  }
}

// //todo:: currentValue'yu guncellemiyor --> mimari sikinti oldugunu dusunuyorum
//   DropdownButton<String> _dropDownButton(BuildContext context) {
//     return DropdownButton<String>(
//       menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
//       value: _currentValue,
//       onChanged: (value) {
//         setState(() {
//           _currentValue = value.toString();
//         });
//       },
//       items: _locations.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(
//             value,
//             style: Theme.of(context).textTheme.headline3,
//           ),
//         );
//       }).toList(),
//     );
// }
