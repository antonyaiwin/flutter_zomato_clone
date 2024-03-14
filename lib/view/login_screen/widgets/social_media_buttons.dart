import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/utils/functions/custom_functions.dart';

import 'more_login_options.dart';

class SocialMediaLoginButtons extends StatelessWidget {
  const SocialMediaLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {},
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 0.5),
              borderRadius: BorderRadius.circular(40),
              image: const DecorationImage(
                image: AssetImage('assets/logos/google_ic.png'),
              ),
            ),
          ),
        ),
        kHSpace(20),
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () {
            // print('show sheet');
            showMyModalBottomSheet(
              context: context,
              height: 210,
              initialChildSize: 0.25,
              maxChildSize: 0.25,
              builder: (context, scrollController) => const MoreLoginOptions(),
            );
          },
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400, width: 0.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(
              Icons.more_horiz,
              size: 32,
              color: ColorConstants.primaryBlack,
            ),
          ),
        ),
      ],
    );
  }
}
