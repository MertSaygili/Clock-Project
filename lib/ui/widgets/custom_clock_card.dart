import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomClockCard extends StatefulWidget {
  const CustomClockCard(
      {Key? key,
      required this.title,
      required this.information,
      required this.clock})
      : super(key: key);

  final String title;
  final String information;
  final String clock;

  @override
  State<CustomClockCard> createState() => _CustomClockCardState();
}

class _CustomClockCardState extends State<CustomClockCard> {
  final double _elevation = 10;

  @override
  Widget build(BuildContext context) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_elevation + 5),
    );

    return Padding(
      padding: PaddignItems().paddingCard,
      child: Card(
        shape: roundedRectangleBorder,
        elevation: _elevation,
        child: ListTile(
          title: _customText(
            widget.title,
            Theme.of(context).textTheme.headline2,
          ),
          subtitle: _customText(
            widget.information,
            Theme.of(context).textTheme.subtitle1,
          ),
          trailing: _customText(
            widget.clock,
            Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }

  Text _customText(String text, TextStyle? style) {
    return Text(
      text,
      style: style,
    );
  }
}
