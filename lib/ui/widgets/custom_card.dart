import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {Key? key,
      required this.title,
      required this.trailing,
      required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;
  final String trailing;

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
              widget.title,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              widget.trailing,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        subtitle: Text(
          widget.subtitle,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        onTap: () {},
      ),
    );
  }
}
