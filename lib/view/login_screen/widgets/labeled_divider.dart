import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  const LabeledDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            indent: 20,
            endIndent: 10,
            color: Colors.grey.shade400,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey),
        ),
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 20,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
