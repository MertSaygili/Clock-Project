import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/stack_button.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {Key? key, required this.title, required this.subtitle, this.days})
      : super(key: key);

  final String? title;
  final String subtitle;
  final List<String>? days;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final double _elevation = 10;
  final double _radius = 15;

  @override
  Widget build(BuildContext context) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_elevation + 5),
    );

    return Padding(
      padding: PaddignItems().paddingCard,
      child: Card(
        elevation: _elevation,
        shape: roundedRectangleBorder,
        child: _checkTitle(),
      ),
    );
  }

  Widget _checkTitle() {
    if (widget.title == null) {
      return Padding(
        padding: PaddignItems().paddingInsideCard,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.subtitle,
              style: Theme.of(context).textTheme.headline1,
            ),
            const StackButton(),
          ],
        ),
      );
    }
    return Padding(
      padding: PaddignItems().paddingInsideCard,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title ?? '',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.headline1,
              ),
              const StackButton(),
            ],
          ),
        ],
      ),
    );
  }
}
