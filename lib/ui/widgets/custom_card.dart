import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/stack_button.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  final double _elevation = 10;
  final double _radius = 15;

  @override
  Widget build(BuildContext context) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_radius),
    );

    return Padding(
      padding: PaddignItems().paddingCard,
      child: Card(
        elevation: _elevation,
        shape: roundedRectangleBorder,
        child: const StackButton(),
      ),
    );
  }
}
