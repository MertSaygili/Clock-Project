import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/custom_stack_button.dart';
import 'package:flutter/material.dart';

class CustomAlarmCard extends StatefulWidget {
  const CustomAlarmCard({
    Key? key,
    required this.title,
    required this.subtitle,
    this.days,
    required this.fun,
  }) : super(key: key);

  final Function fun;
  final String? title;
  final String subtitle;
  final List<String>? days;

  @override
  State<CustomAlarmCard> createState() => _CustomAlarmCardState();
}

class _CustomAlarmCardState extends State<CustomAlarmCard> {
  final double _elevation = 10;

  @override
  Widget build(BuildContext context) {
    final roundedRectangleBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_elevation + 5),
    );

    return Padding(
      padding: PaddingItems().paddingCard,
      child: Card(
        elevation: _elevation,
        shape: roundedRectangleBorder,
        child: _checkTitle(widget.fun),
      ),
    );
  }

  Widget _checkTitle(Function fun) {
    if (widget.title == null) {
      return _CardWithoutTitle(
        subtitle: widget.subtitle,
        fun: widget.fun,
      );
    }
    return _CardWithTitle(
      title: widget.title ?? '',
      subtitle: widget.subtitle,
      fun: widget.fun,
    );
  }
}

class _CardWithTitle extends StatelessWidget {
  const _CardWithTitle({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.fun,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingInsideCard,
      child: Column(
        children: [
          _title(context),
          _SubBlock(
            subtitle: subtitle,
            fun: fun,
          ),
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
    required this.fun,
  }) : super(key: key);

  final Function fun;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems().paddingInsideCard,
      child: _SubBlock(
        subtitle: subtitle,
        fun: fun,
      ),
    );
  }
}

class _SubBlock extends StatelessWidget {
  const _SubBlock({
    Key? key,
    required this.subtitle,
    required this.fun,
  }) : super(key: key);

  final String subtitle;
  final Function fun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        StackButton(fun: fun),
      ],
    );
  }
}
