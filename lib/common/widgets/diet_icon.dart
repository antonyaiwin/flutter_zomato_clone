import 'package:flutter/material.dart';

class DietIcon extends StatelessWidget {
  const DietIcon.vegetarian({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const CircleAvatar(
        radius: 5,
        backgroundColor: Colors.green,
      ),
    );
  }
}
