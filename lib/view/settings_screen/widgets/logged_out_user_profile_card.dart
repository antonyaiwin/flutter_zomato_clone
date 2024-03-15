import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';
import '../../login_screen/login_screen.dart';

class LoggedOutUserProfileCard extends StatelessWidget {
  const LoggedOutUserProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your profile',
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: 28,
              ),
        ),
        kVSpace(5),
        Text(
          'Log in or sign up to view your complete profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: ColorConstants.black3c, fontWeight: FontWeight.w100),
        ),
        kVSpace(15),
        CustomButton.outlined(
          overlayColor: MaterialStatePropertyAll(Colors.red.withOpacity(0.12)),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          borderColor: ColorConstants.primaryColor,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(
                  popOnSkip: true,
                ),
              ),
            );
          },
          child: Text(
            'Continue',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: ColorConstants.primaryColor,
                  fontSize: 19,
                ),
          ),
        ),
      ],
    );
  }
}
