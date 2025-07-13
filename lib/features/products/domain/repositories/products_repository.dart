import 'package:dartz/dartz.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/api_error.dart';
import 'package:product_with_clean_arc/features/products/domain/entities/products.dart';

abstract class ProductsRepository {
  Future<Either<ApiErrorCommonEntity, List<ProductsEntity>>> fetchProducts();
}
