import 'package:product_with_clean_arc/features/common/domain/entities/api_error.dart';
import 'package:product_with_clean_arc/features/products/domain/entities/products.dart';

class ProductEvents {}

class ProductStateInitilized extends ProductEvents {}

class ProductStateFetchingLoading extends ProductEvents {}

class ProductStateFetchingFailed extends ProductEvents {
  final ApiErrorCommonEntity apiErrorMessage;

  ProductStateFetchingFailed({required this.apiErrorMessage});
}

class ProductStateFetchingSuccessful extends ProductEvents {
  final List<ProductsEntity> productsList;

  ProductStateFetchingSuccessful({required this.productsList});
}
