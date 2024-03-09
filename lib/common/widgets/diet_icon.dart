import 'package:flutter/material.dart';

/// Diet Icon based on Constructor.
/// DietIcon.veg()   : Veg Diet Icon Indicator.
/// DietIcon.nonVeg(): Non-Veg Diet Icon Indicator.
/// DietIcon.egg()   : Non-Veg(Egg) Diet Icon Indicator.
class DietIcon extends StatelessWidget {
  /// Veg Diet Icon Indicator
  const DietIcon.veg({
    super.key,
  })  : child = const CircleAvatar(
          radius: 4.5,
          backgroundColor: green,
        ),
        color = green,
        scale = 1,
        egg = false;

  /// Non-Veg Diet Icon Indicator
  const DietIcon.nonVeg({
    super.key,
  })  : child = const RotatedBox(
          quarterTurns: 3,
          child: Icon(
            Icons.play_arrow_rounded,
            size: 15,
            color: brown,
          ),
        ),
        color = brown,
        scale = 1.2,
        egg = false;

  /// Non-Veg(Egg) Diet Icon Indicator
  const DietIcon.egg({
    super.key,
  })  : child = const RotatedBox(
          quarterTurns: 3,
          child: Icon(
            Icons.play_arrow_rounded,
            size: 15,
            color: brown,
          ),
        ),
        color = brown,
        scale = 1.2,
        egg = true;

  final Widget child;
  final Color color;
  final double scale;
  final bool egg;

  // static colors
  static const Color green = Colors.green;
  static const Color brown = Color.fromRGBO(191, 54, 12, 1);

  @override
  Widget build(BuildContext context) {
    if (egg) {
      return Container(
        height: 17,
        width: egg ? null : 17,
        padding: const EdgeInsets.symmetric(horizontal: 1),
        decoration: BoxDecoration(
          color: color,
          // border: Border.all(color: color),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Transform.scale(scale: scale, child: child),
            ),
            const SizedBox(width: 3),
            const Text(
              'Egg',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            const SizedBox(width: 3),
          ],
        ),
      );
    }
    return Container(
      height: 17,
      width: 17,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Transform.scale(scale: scale, child: child),
    );
  }
}
