import 'package:flutter/cupertino.dart';

class CustomExpanded extends StatelessWidget {
  const CustomExpanded({Key? key, required this.child, required this.flex})
      : super(key: key);
  final Widget child;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: flex, child: child);
  }
}
