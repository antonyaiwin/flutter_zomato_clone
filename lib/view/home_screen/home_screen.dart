import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/view/home_screen/pages/delivery_page/delivery_page.dart';
import 'package:flutter_zomato_clone/view/home_screen/pages/dining_page/dining_page.dart';

import 'widgets/home_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          DeliveryPage(),
          DiningPage(),
        ],
      ),
      bottomNavigationBar: HomeBottomNavigationBar(
        selectedIndex: selectedPageIndex,
        onTap: (index) {
          if (selectedPageIndex != index) {
            _pageController.jumpToPage(index);
            setState(() {
              selectedPageIndex = index;
            });
          }
        },
      ),
    );
  }
}
