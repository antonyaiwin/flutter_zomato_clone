import 'package:flutter/material.dart';

import '../../../common/widgets/spacer.dart';
import '../../../common/widgets/user_circle_avatar.dart';
import '../../../utils/constants/colors.dart';

class LoggedInUserProfileCard extends StatelessWidget {
  const LoggedInUserProfileCard({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20)
              .copyWith(bottom: 10),
          child: Row(
            children: [
              UserCircleAvatar(
                userName: userName,
                radius: 35,
                textStyle: const TextStyle(fontSize: 35),
              ),
              kHSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  kVSpace(25),
                  GestureDetector(
                      child: const Row(
                    children: [
                      Text(
                        'View activity',
                        style: TextStyle(
                          color: ColorConstants.primaryColor,
                        ),
                      ),
                      Icon(Icons.arrow_right),
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          color: ColorConstants.primaryBlack,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [
                      ColorConstants.goldShade6,
                      ColorConstants.goldShade3,
                      ColorConstants.goldShade6,
                    ],
                  ),
                  border: Border.all(
                    color: ColorConstants.goldShade1.withOpacity(0.3),
                    width: 6,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                child: const Icon(
                  Icons.workspace_premium,
                  color: ColorConstants.primaryBlack,
                ),
              ),
              kHSpace(20),
              Expanded(
                child: Text(
                  'Join Zomato Gold',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorConstants.goldShade3),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 25,
                color: ColorConstants.goldShade3,
              )
            ],
          ),
        )
      ],
    );
  }
}
