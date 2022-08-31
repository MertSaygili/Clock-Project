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
      return _CardWithoutTitle(subtitle: widget.subtitle);
    }
    return _CardWithTitle(title: widget.title ?? '', subtitle: widget.subtitle);
  }
}

class _CardWithTitle extends StatelessWidget {
  const _CardWithTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddignItems().paddingInsideCard,
      child: Column(
        children: [
          _title(context),
          _SubBlock(subtitle: subtitle),
        ],
      ),
    );
  }

  Align _title(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _CardWithoutTitle extends StatelessWidget {
  const _CardWithoutTitle({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddignItems().paddingInsideCard,
      child: _SubBlock(subtitle: subtitle),
    );
  }
}

class _SubBlock extends StatelessWidget {
  const _SubBlock({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        const StackButton(),
      ],
    );
  }
}
