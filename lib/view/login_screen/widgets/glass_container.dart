import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  const GlassContainer({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        overlayColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1)),
        child: Container(
          width: 60,
          height: 30,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: child,
        ),
      ),
    );
  }
}
