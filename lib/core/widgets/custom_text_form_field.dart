import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textInputType,
    required this.hintText,
    this.suffixIcon,
  });

  final TextInputType textInputType;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xFFF9FAFA),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xFF949D9E),
        ),
        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Color(0xFFE6E9E9),
        width: 1,
      ),
    );
  }
}
