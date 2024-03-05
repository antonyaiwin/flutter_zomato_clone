import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onTap,
    required this.text,
    this.textColor,
  });
  final void Function()? onTap;
  final String text;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: textColor ?? ColorConstants.primaryColor,
        ),
      ),
    );
  }
}
