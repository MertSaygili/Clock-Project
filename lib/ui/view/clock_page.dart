// ignore_for_file: unused_field

import 'dart:async';
import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/time/time.dart';
import 'package:clock_project/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_expanded.dart';

class ClockPageView extends StatefulWidget {
  const ClockPageView({Key? key}) : super(key: key);

  @override
  State<ClockPageView> createState() => _ClockPageViewState();
}

class _ClockPageViewState extends State<ClockPageView> with Time {
  final DateFormat _dateFormat = DateFormat('Hms');
  final PaddignItems _paddignItems = PaddignItems();
  final double _elevation = 15;
  late String _now;
  late Timer _everySecond;

  @override
  void initState() {
    super.initState();
    setTime();
    updateTime();
  }

  @override
  void dispose() {
    super.dispose();
    disposeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _paddignItems.paddingScreen,
      child: Column(
        children: [
          CustomExpanded(
            flex: 2,
            child: _CustomListView(paddignItems: _paddignItems, now: _now),
          ),
          const CustomExpanded(
            flex: 3,
            child: _CustomCardListView(),
          ),
        ],
      ),
    );
  }

  // current time functions
  @override
  setTime() {
    _now = _dateFormat.format(DateTime.now()).toString();
  }

  @override
  updateTime() {
    _everySecond = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        setTime();
      });
    });
  }

  @override
  disposeTimer() {
    _everySecond.cancel();
  }
}

class _CustomListView extends StatefulWidget {
  const _CustomListView({
    Key? key,
    required PaddignItems paddignItems,
    required String now,
  })  : _paddignItems = paddignItems,
        _now = now,
        super(key: key);

  final PaddignItems _paddignItems;
  final String _now;

  @override
  State<_CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<_CustomListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _time(context),
        _icons(),
      ],
    );
  }

  Row _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: IconItems().addIcon,
        ),
        IconButton(
          onPressed: () {},
          icon: IconItems().settingsIcon,
        ),
      ],
    );
  }

  Padding _time(BuildContext context) {
    return Padding(
      padding: widget._paddignItems.paddingTimer,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          widget._now,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}

class _CustomCardListView extends StatelessWidget {
  const _CustomCardListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddignItems().paddingCard,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) {
          return const CustomCard(
            title: 'Istanbul',
            trailing: '18:20',
            subtitle: 'Yerel saat',
          );
        }),
      ),
    );
  }
}
