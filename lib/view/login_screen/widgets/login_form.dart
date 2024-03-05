import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/spacer.dart';
import '../../verification_screen/verification_screen.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
    this.onCountryChanged,
    required this.selectedCountryCode,
    required this.phoneNumberController,
  });

  final void Function(CountryCode value)? onCountryChanged;
  final String selectedCountryCode;
  final TextEditingController phoneNumberController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(left: 30),
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.grey.shade400,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: CountryCodePicker(
                  builder: (selectedCountry) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: Image.asset(
                              selectedCountry!.flagUri!,
                              package: 'country_code_picker',
                              width: 32,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                  hideMainText: true,
                  padding: EdgeInsets.zero,
                  initialSelection: selectedCountryCode,
                  onChanged: onCountryChanged,
                ),
              ),
            ),
            kHSpace(10),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 30),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.5,
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Form(
                  key: formKey,
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 2.5, right: 6),
                          child: Text(
                            selectedCountryCode,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          )),
                      prefixIconConstraints: const BoxConstraints(minWidth: 0),
                      border: InputBorder.none,
                      hintText: 'Enter Phone Number',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'Please enter a valid phone number!';
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        kVSpace(15),
        Row(
          children: [
            kHSpace(30),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(
                          phoneNumber:
                              '$selectedCountryCode-${phoneNumberController.text}',
                        ),
                      ),
                    );
                  }
                },
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 14))),
                child: const Text(
                  'Continue',
                ),
              ),
            ),
            kHSpace(30),
          ],
        ),
      ],
    );
  }
}
