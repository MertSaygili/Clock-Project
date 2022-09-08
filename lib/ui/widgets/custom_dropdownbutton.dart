import 'package:clock_project/time/time_zones.dart';
import 'package:flutter/material.dart';

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
        String time = _timeZones.getTimeOfLocation(value);
        setState(() {
          _currentItem = value.toString();
          widget.fun(_currentItem, time);
        });
      },
    );
  }
}
