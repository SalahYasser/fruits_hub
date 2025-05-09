import 'package:dartz/dartz.dart';
import 'package:fruits_hub/core/errors/failures.dart';

import '../../../features/checkout/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});

}