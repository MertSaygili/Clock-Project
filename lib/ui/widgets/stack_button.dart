import 'package:flutter/material.dart';

class StackButton extends StatefulWidget {
  const StackButton({Key? key}) : super(key: key);

  @override
  State<StackButton> createState() => _StackButtonState();
}

class _StackButtonState extends State<StackButton> {
  Alignment _align = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Align(
              alignment: _align,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _align = Alignment.centerRight;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
