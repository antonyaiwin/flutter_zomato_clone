import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/utils/functions/shared_preferences_utils.dart';
import 'package:flutter_zomato_clone/view/home_screen/home_screen.dart';

import '../../utils/constants/colors.dart';
import '../login_screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToNextScreen(context);
    return const Scaffold(
      backgroundColor: ColorConstants.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Xomato',
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Eco-Friendly Deliveries',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToNextScreen(BuildContext context) async {
    bool val = await SharedPreferencesUtils.getLoginedUser() == null;
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  val ? const LoginScreen() : const HomeScreen(),
            )));
  }
}
