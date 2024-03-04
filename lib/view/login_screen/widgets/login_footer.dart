import 'package:flutter/cupertino.dart';

import '../../../../../common/widgets/spacer.dart';
import 'underlined_text_button.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'By continuing, you agree to our',
          style: TextStyle(fontSize: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UnderlinedTextButton(
              text: 'Terms of Service',
              onTap: () {},
            ),
            kHSpace(10),
            UnderlinedTextButton(
              text: 'Privacy Policy',
              onTap: () {},
            ),
            kHSpace(10),
            UnderlinedTextButton(
              text: 'Content Policy',
              onTap: () {},
            ),
            kVSpace(20),
          ],
        )
      ],
    );
  }
}
