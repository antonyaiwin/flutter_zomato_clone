import 'package:flutter/material.dart';

import '../main_chips.dart';

class MainChipsSliverAppBar extends StatelessWidget {
  const MainChipsSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: 50,
      flexibleSpace: Center(
        child: MainChips(),
      ),
      primary: false,
      pinned: true,
    );
  }
}
