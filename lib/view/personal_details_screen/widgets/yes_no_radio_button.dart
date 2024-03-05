import 'package:flutter/material.dart';

import '../../../common/widgets/spacer.dart';
import '../../../utils/constants/colors.dart';

class YesNoRadioButton extends StatefulWidget {
  const YesNoRadioButton({
    super.key,
    this.onValueChanged,
  });
  final void Function(bool yesSelected)? onValueChanged;
  @override
  State<YesNoRadioButton> createState() => _YesNoRadioButtonState();
}

class _YesNoRadioButtonState extends State<YesNoRadioButton> {
  bool? yesSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              yesSelected = true;
            });
            widget.onValueChanged!(yesSelected!);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: yesSelected != null && yesSelected!
                      ? ColorConstants.primaryColor
                      : ColorConstants.black3c.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text('Yes'),
          ),
        ),
        kHSpace(10),
        GestureDetector(
          onTap: () {
            setState(() {
              yesSelected = false;
            });
            widget.onValueChanged!(yesSelected!);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: yesSelected != null && !yesSelected!
                      ? ColorConstants.primaryColor
                      : ColorConstants.black3c.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Text('No'),
          ),
        ),
      ],
    );
  }
}
