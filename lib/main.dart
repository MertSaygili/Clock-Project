import 'package:clock_project/ui/view/clock_page.dart';
import 'package:flutter/material.dart';

// timezone->https://pub.dev/packages/timezone
// time-> https://pub.dev/packages/time
// date format -> https://pub.dev/packages/intl
// date format ICU names -> https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClockPageView(),
    );
  }
}
