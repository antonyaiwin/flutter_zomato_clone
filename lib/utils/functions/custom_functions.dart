import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

void showMyModalBottomSheet({
  required BuildContext context,
  double? height,
  EdgeInsetsGeometry? contentPadding,
  required ScrollableWidgetBuilder builder,
  double initialChildSize = /* 0.5 */ 0.66,
  double minChildSize = 0.25,
  double maxChildSize = /* 1.0 */ 0.75,
  bool expand = true,
  bool snap = /* false */ true,
}) {
  showModalBottomSheet(
    context: context,
    elevation: 0,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.pop(context),
        child: DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: expand,
          snap: snap,
          builder: (context, scrollController) => Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -60,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: CupertinoColors.black.withOpacity(0.7),
                  radius: 23,
                  child: const Icon(
                    MingCute.close_fill,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                child: Ink(
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      color:
                          Theme.of(context).bottomSheetTheme.backgroundColor),
                  padding: contentPadding,
                  child: builder(context, scrollController),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
