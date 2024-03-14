import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../utils/constants/colors.dart';

class CustomOutlinedTextField extends StatefulWidget {
  const CustomOutlinedTextField({
    super.key,
    required this.hintText,
    this.showPrefix = true,
    this.controller,
  });
  final String? hintText;
  final bool showPrefix;
  final TextEditingController? controller;

  @override
  State<CustomOutlinedTextField> createState() =>
      _CustomOutlinedTextFieldState();
}

class _CustomOutlinedTextFieldState extends State<CustomOutlinedTextField> {
  bool showClear = false;

  final InputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorConstants.black3c.withOpacity(0.15),
    ),
    borderRadius: BorderRadius.circular(15),
  );

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller!.addListener(textListener);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(textListener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        controller: widget.controller,
        cursorWidth: 0.5,
        cursorColor: ColorConstants.black3c,
        decoration: InputDecoration(
            prefixIcon: widget.showPrefix
                ? const Icon(
                    EvaIcons.search,
                    color: ColorConstants.primaryColor,
                  )
                : null,
            suffixIcon: !showClear
                ? null
                : GestureDetector(
                    onTap: () {
                      widget.controller?.clear();
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: ColorConstants.black3c,
                      size: 20,
                    )),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            hintText: widget.hintText),
      ),
    );
  }

  void textListener() {
    if (showClear && widget.controller!.text.isEmpty) {
      setState(() {
        showClear = false;
      });
    } else if (!showClear && widget.controller!.text.isNotEmpty) {
      setState(() {
        showClear = true;
      });
    }
  }
}
