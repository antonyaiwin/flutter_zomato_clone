import 'package:flutter/material.dart';
import 'package:flutter_zomato_clone/utils/constants/colors.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
    required this.count,
    this.onAddPressed,
    this.onRemovePressed,
  });
  final void Function()? onAddPressed;
  final void Function()? onRemovePressed;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: ColorConstants.primaryColor.withOpacity(0.1),
        border: Border.all(
          color: ColorConstants.primaryColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                child: GestureDetector(
                    onTap: onRemovePressed, child: const Icon(Icons.remove))),
            Expanded(
                flex: 2,
                child: Text(
                  '$count',
                  textAlign: TextAlign.center,
                )),
            Flexible(
                flex: 1,
                child: GestureDetector(
                    onTap: onAddPressed, child: const Icon(Icons.add))),
          ],
        ),
      ),
    );
  }
}
