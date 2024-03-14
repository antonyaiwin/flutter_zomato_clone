import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/common/widgets/custom_button.dart';
import 'package:flutter_zomato_clone/common/widgets/diet_icon.dart';
import 'package:flutter_zomato_clone/common/widgets/spacer.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';
import 'package:flutter_zomato_clone/view/home_screen/home_screen.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/functions/custom_functions.dart';
import 'widgets/yes_no_radio_button.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final TextEditingController nameController = TextEditingController();
  bool? isVegetarian;
  bool whatsappUpdatesChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What\'s your name?',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            kVSpace(10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstants.black3c.withOpacity(.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: ColorConstants.black3c,
                  ),
                ),
              ),
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                setState(() {});
              },
            ),
            kVSpace(25),
            Row(
              children: [
                const DietIcon.veg(),
                kHSpace(8),
                Text(
                  'Are you a vegetarian?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            kVSpace(10),
            YesNoRadioButton(
              onValueChanged: (yesSelected) {
                setState(() {
                  isVegetarian = yesSelected;
                });
              },
            ),
            const Spacer(),
            InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onTap: () {
                setState(() {
                  whatsappUpdatesChecked = !whatsappUpdatesChecked;
                });
              },
              child: IgnorePointer(
                ignoring: true,
                child: Row(
                  children: [
                    Brand(
                      Brands.whatsapp,
                      size: 30,
                    ),
                    Text(
                      'Send me updates on WhatsApp',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Spacer(),
                    Checkbox(
                      value: whatsappUpdatesChecked,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: nameController.text.length > 3 && isVegetarian != null
                  ? () {
                      verifyDetails();
                    }
                  : null,
              child: const Text(
                'Done',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyDetails() {
    showMyDialog(
      context: context,
      content: Row(
        children: [
          const CircularProgressIndicator(),
          kHSpace(20),
          const Text('Verifying credentials..')
        ],
      ),
    );

    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false),
    );
  }
}
