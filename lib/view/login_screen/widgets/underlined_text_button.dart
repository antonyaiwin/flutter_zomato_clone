import 'package:flutter/material.dart';

class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UnderlinedTextButton(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
