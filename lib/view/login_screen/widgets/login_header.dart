import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/view/home_screen/home_screen.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'glass_container.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          kLoginHeaderImage,
          height: 350,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 42,
          left: 25,
          height: 30,
          width: 60,
          child: GlassContainer(
            onTap: () {
              // print('ontap language');
            },
            child: const Icon(
              Icons.g_translate,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Positioned(
          top: 42,
          right: 25,
          height: 30,
          width: 60,
          child: GlassContainer(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            child: const Text(
              'Skip',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
