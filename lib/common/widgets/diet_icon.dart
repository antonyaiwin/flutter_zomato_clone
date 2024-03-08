import 'package:flutter/material.dart';

class DietIcon extends StatelessWidget {
  const DietIcon.veg({
    super.key,
  })  : child = const CircleAvatar(
          radius: 5,
          backgroundColor: Colors.green,
        ),
        color = Colors.green;
  const DietIcon.nonVeg({
    super.key,
  })  : child = const Text(
          '▲',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 15,
            height: 0.4,
            letterSpacing: -4.6,
            color: Colors.brown,
          ),
        ),
        color = Colors.brown;

  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 17,
        width: 17,
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(5),
        ),
        child: child);
  }
}
