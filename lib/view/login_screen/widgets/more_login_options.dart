import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';

class MoreLoginOptions extends StatelessWidget {
  const MoreLoginOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
  }
}
