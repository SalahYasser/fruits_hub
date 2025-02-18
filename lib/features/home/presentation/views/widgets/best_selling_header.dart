import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: TextStyles.bold16,
        ),
        const Spacer(),
        Text(
          'المزيد',
          textAlign: TextAlign.center,
          style: TextStyles.regular13.copyWith(
            color: Color(0xFF949D9E),
          ),
        )
      ],
    );
  }
}
