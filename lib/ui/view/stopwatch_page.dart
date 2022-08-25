import 'package:clock_project/constants/constants.dart';
import 'package:clock_project/ui/widgets/custom_expanded.dart';
import 'package:flutter/material.dart';

class StopWatchPageView extends StatefulWidget {
  const StopWatchPageView({Key? key}) : super(key: key);

  @override
  State<StopWatchPageView> createState() => _StopWatchPageViewState();
}

class _StopWatchPageViewState extends State<StopWatchPageView> {
  final PaddignItems _paddignItems = PaddignItems();
  final String _time = '00:00:00';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _paddignItems.paddingScreen,
      child: Column(
        children: [
          CustomExpanded(
            flex: 3,
            child: ListView(children: [Text(_time)]),
          ),
        ],
      ),
    );
  }
}
