import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/home_screen/home_screen.dart';
import 'package:flutter_zomato_clone/view/personal_details_screen/personal_details_screen.dart';
import 'package:flutter_zomato_clone/view/verification_screen/widgets/more_verification_options.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../utils/functions/custom_functions.dart';
import 'widgets/custom_text_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final OtpFieldController otpController = OtpFieldController();

  double messageOpacity = 1;
  int counter = 20;
  bool loading = false;
  bool invalidOtp = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).then((value) => setState(() {
          messageOpacity = 0;
        }));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counter--;
      });
      if (counter == 0) {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
        actions: [
          if (counter == 0)
            CustomTextButton(
              text: 'Skip',
              textColor: ColorConstants.primaryBlack,
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              ),
            ),
          kHSpace(20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Text('We have send a verification code to'),
            kVSpace(5),
            Text(
              widget.phoneNumber,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            kVSpace(35),
            OTPTextField(
              contentPadding: const EdgeInsets.symmetric(vertical: 13),
              otpFieldStyle: OtpFieldStyle(
                  focusBorderColor: ColorConstants.black3c,
                  enabledBorderColor: ColorConstants.black3c.withOpacity(0.3)),
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              fieldStyle: FieldStyle.box,
              outlineBorderRadius: 10,
              style: const TextStyle(fontSize: 17),
              onCompleted: (pin) {
                validateOTP(pin);
              },
            ),
            kVSpace(15),
            if (invalidOtp)
              const Text(
                'The OTP entered is invalid/incorrect. Please try again',
                style: TextStyle(color: ColorConstants.primaryColorDark),
              ),
            AnimatedOpacity(
              opacity: messageOpacity,
              duration: Durations.long1,
              child: const Text(
                'Check text messages for your OTP',
                style: TextStyle(color: ColorConstants.blue),
              ),
            ),
            kVSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Didn\'t get the OTP? '),
                counter > 0
                    ? CustomTextButton(
                        text: 'Resend SMS in ${counter}s',
                        textColor: ColorConstants.black3c.withOpacity(0.5),
                      )
                    : const CustomTextButton(text: 'Resend SMS'),
              ],
            ),
            kVSpace(8),
            if (counter == 0)
              CustomTextButton(
                text: 'Try more options',
                onTap: () {
                  showMyModalBottomSheet(
                      context: context,
                      minChildSize: 0.25,
                      maxChildSize: 0.25,
                      initialChildSize: 0.25,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      builder: (context, scrollController) =>
                          const MoreVerificationOptions());
                },
              ),
            const Spacer(),
            CustomTextButton(
              text: 'Go back to login methods',
              onTap: () => Navigator.pop(context),
            ),
            kVSpace(20),
            Opacity(
                opacity: loading ? 1 : 0,
                child: const CircularProgressIndicator()),
            kVSpace(10),
          ],
        ),
      ),
    );
  }

  void validateOTP(String pin) {
    setState(() {
      invalidOtp = false;
      loading = true;
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (pin == '123456') {
        setState(() {
          loading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PersonalDetailsScreen(),
            ));
      } else {
        setState(() {
          loading = false;
          invalidOtp = true;
        });
      }
    });
  }
}
