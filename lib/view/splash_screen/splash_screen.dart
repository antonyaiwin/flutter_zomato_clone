import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/utils/constants/image_strings.dart';
import 'package:flutter_zomato_clone/utils/functions/shared_preferences_utils.dart';
import 'package:flutter_zomato_clone/view/home_screen/home_screen.dart';

import '../login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(kSplashImage), context);
    precacheImage(const AssetImage(kLoginHeaderImage), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    navigateToNextScreen(context);
    return Image.asset(
      kSplashImage,
      fit: BoxFit.cover,
      alignment: Alignment.bottomCenter,
    );
  }

  void navigateToNextScreen(BuildContext context) async {
    bool val = await SharedPreferencesUtils.getLoginedUser() == null;
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => val ? const LoginScreen() : const HomeScreen(),
        ),
      ),
    );
  }
}
