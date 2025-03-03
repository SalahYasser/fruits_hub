import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/helper_functions/build_error_bar.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import '../../../../../constants.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {

  late PageController pageController;

  ValueNotifier<AutovalidateMode> autovalidateMode = ValueNotifier(
    AutovalidateMode.disabled,
  );

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentIndexPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    autovalidateMode.dispose();
    super.dispose();
  }

  int currentIndexPage = 0;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            pageController: pageController,
            currentIndexPage: currentIndexPage,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              formKey: formKey,
              pageController: pageController,
              valueListenable: autovalidateMode,
            ),
          ),
          CustomButton(
            text: getNextButtonText(),
            onPressed: () {
              if (currentIndexPage == 0) {
                handleShippingSectionValidation(context);
              } else {
                handleAddressValidation();
              }
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void handleShippingSectionValidation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentIndexPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      buildBar(context, 'قم بتحديد طريقة الدفع');
    }
  }

  String getNextButtonText() {
    switch (currentIndexPage) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }

  void handleAddressValidation() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      pageController.animateToPage(
        currentIndexPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      autovalidateMode.value = AutovalidateMode.always;
    }
  }
}
