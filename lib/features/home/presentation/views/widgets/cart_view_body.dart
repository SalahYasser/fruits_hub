import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/build_app_bar_widget.dart';
import '../../../../../core/widgets/custom_divider.dart';
import 'cart_header.dart';
import 'cart_items_list.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  buildAppBarWidget(
                    context,
                    title: 'السلة',
                    showNotification: false,
                  ),
                  SizedBox(height: kTopPadding),
                  CartHeader(),
                  SizedBox(height: 8),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : CustomDivider(),
            ),
            CartItemsList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? SizedBox()
                  : CustomDivider(),
            ),
          ],
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: MediaQuery.sizeOf(context).height * 0.05,
          child: CustomCartButton(),
        ),
      ],
    );
  }
}


