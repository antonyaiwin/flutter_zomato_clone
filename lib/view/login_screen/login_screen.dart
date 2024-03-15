import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/view/login_screen/widgets/social_media_buttons.dart';

import '../../common/widgets/spacer.dart';
import 'widgets/labeled_divider.dart';
import 'widgets/login_footer.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.popOnSkip = false,
  });
  final bool popOnSkip;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountryCode = '+91';
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginHeader(
              popOnSkip: widget.popOnSkip,
            ),
            kVSpace(15),
            const Text(
              'India\'s #1 Food Delivery \nand Dining App',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
              ),
            ),
            kVSpace(20),
            const LabeledDivider(label: 'Log in or sign up'),
            kVSpace(20),
            LoginForm(
              selectedCountryCode: selectedCountryCode,
              phoneNumberController: phoneNumberController,
              onCountryChanged: (value) {
                setState(() {
                  selectedCountryCode = value.dialCode!;
                });
              },
            ),
            kVSpace(10),
            const LabeledDivider(label: 'or'),
            kVSpace(20),
            const SocialMediaLoginButtons(),
            kVSpace(20),
            const LoginFooter()
          ],
        ),
      ),
    );
  }
}
