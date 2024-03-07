import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/constants/colors.dart';

class TimeDistanceWidget extends StatelessWidget {
  const TimeDistanceWidget({
    super.key,
    required this.timeInMinutes,
    required this.distanceInKm,
    this.foregroundColor,
  });

  final String timeInMinutes;
  final double distanceInKm;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          BoxIcons.bx_stopwatch,
          color: foregroundColor ?? ColorConstants.black3c,
        ),
        Text.rich(
          TextSpan(
            text: timeInMinutes,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: foregroundColor ??
                      ColorConstants.black3c.withOpacity(0.5),
                ),
            children: [
              TextSpan(
                  text: ' • ',
                  style: TextStyle(
                      color: foregroundColor ?? ColorConstants.primaryBlack)),
              TextSpan(text: '${distanceInKm.toStringAsFixed(1)} km'),
            ],
          ),
        ),
      ],
    );
  }
}
