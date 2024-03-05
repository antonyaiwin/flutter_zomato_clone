import 'package:flutter/material.dart';

void showMyModalBottomSheet({
  required BuildContext context,
  required Widget child,
  double? height,
  EdgeInsetsGeometry? contentPadding,
}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
    ),
    context: context,
    builder: (context) {
      return Container(
        height: height,
        padding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: child,
      );
    },
  );
}
