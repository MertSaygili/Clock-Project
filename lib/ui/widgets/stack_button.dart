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
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Align(
              alignment: _align,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Transform.rotate(angle: 180);
                    _align = Alignment.centerRight;
                  });
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple,
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
