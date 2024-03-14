import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  const HomeBottomNavigationBar(
      {super.key, required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final void Function(int index) onTap;
  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int get index => widget.selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstants.primaryWhite,
      elevation: 10,
      child: DefaultTextStyle(
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w600),
        child: SizedBox(
          height: kToolbarHeight,
          child: Column(
            children: [
              AnimatedAlign(
                alignment: widget.selectedIndex == 0
                    ? Alignment.topLeft
                    : Alignment.topRight,
                duration: const Duration(milliseconds: 150),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 4,
                  width: MediaQuery.sizeOf(context).width / 2 - 60,
                  decoration: const BoxDecoration(
                    color: ColorConstants.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          widget.onTap(0);
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                index == 0
                                    ? MingCute.ebike_fill
                                    : MingCute.ebike_line,
                                color: index == 0
                                    ? null
                                    : ColorConstants.black3c.withOpacity(0.4),
                              ),
                              kHSpace(10),
                              const Text('Delivery'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: ColorConstants.black3c.withOpacity(0.15),
                      indent: 12,
                      endIndent: 12,
                      width: 1,
                    ),
                    Expanded(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          widget.onTap(1);
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                index == 1
                                    ? Icons.ramen_dining
                                    : Icons.ramen_dining_outlined,
                                color: index == 1
                                    ? null
                                    : ColorConstants.black3c.withOpacity(0.4),
                              ),
                              kHSpace(10),
                              const Text('Dining'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
