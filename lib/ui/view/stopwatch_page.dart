import 'package:clock_project/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StopwatchPageView extends StatefulWidget {
  const StopwatchPageView({Key? key}) : super(key: key);

  @override
  State<StopwatchPageView> createState() => _StopwatchPageViewState();
}

class _StopwatchPageViewState extends State<StopwatchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: const [
          Icon(
            Icons.abc,
            color: Colors.black,
          )
        ],
        backgroundColor: AllColors().colorWhite,
      ),
      body: Column(
        children: const [
          Text('merhaba'),
        ],
      ),
    );
  }
}
