import 'package:fruits_hub/features/checkout/domain/entities/shipping_address_entity.dart';

import '../../../home/domain/entities/cart_entity.dart';

class OrderEntity {
  final String uID;
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity;

  OrderEntity(
    this.cartEntity, {
    required this.uID,
    this.payWithCash,
    required this.shippingAddressEntity,
  });

  double calculateShippingCost() {
    if (payWithCash!) {
      return 50;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }

}
