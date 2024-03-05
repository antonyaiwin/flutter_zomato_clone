import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/custom_button.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/utils/functions/custom_functions.dart';

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
            print('show sheet');
            showMyModalBottomSheet(
              context: context,
              height: 210,
              child: Column(
                children: [
                  CustomButton.outlined(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue.shade700,
                          size: 30,
                        ),
                        kHSpace(10),
                        Text(
                          'Continue with Facebook',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorConstants.black3c.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  kVSpace(10),
                  CustomButton.outlined(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email,
                          color: ColorConstants.black3c,
                          size: 30,
                        ),
                        kHSpace(10),
                        Text(
                          'Continue with Email',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorConstants.black3c.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
            ),
          ),
        ),
      ],
    );
  }
}
