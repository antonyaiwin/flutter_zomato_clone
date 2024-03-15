import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class UserCircleAvatar extends StatelessWidget {
  const UserCircleAvatar({
    super.key,
    required this.userName,
    this.radius = 18,
    this.textStyle,
  });

  final String userName;
  final double radius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: ColorConstants.blue.withOpacity(0.5),
      child: Text(
        userName.characters.first,
        style: textStyle ?? const TextStyle(fontSize: 23),
      ),
    );
  }
}
