import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          color: rating > 3
              ? ColorConstants.ratingBgGreen
              : rating > 2
                  ? ColorConstants.ratingBgAmber
                  : ColorConstants.ratingBgRed,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(color: ColorConstants.primaryWhite),
          ),
          const Icon(
            Icons.star,
            color: ColorConstants.primaryWhite,
            size: 12,
          ),
        ],
      ),
    );
  }
}
