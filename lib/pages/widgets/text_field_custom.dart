import 'package:flutter/material.dart';

import '../../utils/my_colors.dart';

class TextFieldCustom extends StatelessWidget {
  final String? hintText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextInputType? keyboardType;
  final int? minLines;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const TextFieldCustom({
    super.key,
    this.hintText,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      minLines: minLines,
      maxLines: null,
      autocorrect: false,
      cursorColor: MyColors.primary,
      keyboardType: keyboardType,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: TextOverflow.ellipsis),
      decoration: InputDecoration(
        filled: false,
        border: InputBorder.none,
        hintText: hintText,
      ),
    );
  }
}
