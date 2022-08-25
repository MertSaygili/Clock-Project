import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {Key? key, required this.city, required this.clock, required this.info})
      : super(key: key);

  final String city;
  final String clock;
  final String info;

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
        minVerticalPadding: 15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.city,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              widget.clock,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        subtitle: Text(
          widget.info,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        onTap: () {},
      ),
    );
  }
}
