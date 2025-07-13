import 'package:dartz/dartz.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/api_error.dart';
import 'package:product_with_clean_arc/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSrc {
  Future<Either<ApiErrorCommonEntity, List<ProductModel>>> getProducts();
}
