// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'custom_dropdownbutton.dart';
import 'custom_icon_button.dart';
import 'custom_stack_divider.dart';

class CustomSheet extends StatefulWidget {
  const CustomSheet({super.key, required this.size});

  final double size;

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  final String _add = 'Ekle';
  late var _location;
  String _timeZoneName = 'Africa/Abidjan';
  String _time = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.size,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomStackDivider(),
          CustomDropdownButton(fun: _setTimezone),
          _timeText(context),
          ElevatedButton(onPressed: () => _addData(), child: Text(_add)),
        ],
      ),
    );
  }

  Text _timeText(BuildContext context) {
    return Text(
      'Current time: $_time in ${_timeZoneName.split('/')[1]}',
      style: Theme.of(context).textTheme.subtitle2,
      maxLines: 1,
      overflow: TextOverflow.fade,
    );
  }

  // functions
  void _setTimezone(String timeZoneName, String time, var location) =>
      setState(() {
        _timeZoneName = timeZoneName;
        _time = time;
        _location = location;
      });
  void _addData() => Navigator.of(context).pop<String>(_location);
}
