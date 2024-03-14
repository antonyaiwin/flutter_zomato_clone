import 'package:flutter/material.dart';

class MainChipsSliverAppBar extends StatelessWidget {
  const MainChipsSliverAppBar({
    super.key,
    required this.flexibleSpace,
  });
  final Widget flexibleSpace;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      flexibleSpace: Center(child: flexibleSpace),
      primary: false,
      pinned: true,
    );
  }
}
