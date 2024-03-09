import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';

class MoreVerificationOptions extends StatelessWidget {
  const MoreVerificationOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'More options',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Divider(
          color: ColorConstants.black3c.withOpacity(0.1),
        ),
        CustomButton.outlined(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          onTap: () {},
          child: Row(
            children: [
              const Icon(Bootstrap.whatsapp),
              kHSpace(6),
              const Text(
                'Sent OTP on WhatsApp',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              )
            ],
          ),
        ),
        CustomButton.outlined(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          onTap: () {},
          child: Row(
            children: [
              const Icon(Icons.call),
              kHSpace(6),
              const Text(
                'Call me instead',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              )
            ],
          ),
        ),
      ],
    );
  }
}
