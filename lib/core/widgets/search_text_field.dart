import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        // keyboardType: TextInputType,
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.assetsImagesSearchIcon),
            ),
          ),
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(Assets.assetsImagesSearchFiltering),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: 'ابحث عن.......',
          hintStyle: TextStyles.regular13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }
}
