import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {Key? key, this.title, required this.clock, required this.days})
      : super(key: key);

  final String? title;
  final String clock;
  final List<String> days;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final double elevationAndRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevationAndRadius,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(elevationAndRadius),
      ),
      child: ListTile(
        dense: false,
        minVerticalPadding: 20,
        title: Text(
          widget.title ?? '',
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          widget.clock,
          style: Theme.of(context).textTheme.headline3,
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.abc_outlined),
        ),
        onTap: () {},
      ),
    );
  }
}
