import 'package:dartz/dartz.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/api_error.dart';
import 'package:product_with_clean_arc/features/products/data/data_source/product_remote_data_src.dart';
import 'package:product_with_clean_arc/features/products/domain/entities/products.dart';
import 'package:product_with_clean_arc/features/products/domain/repositories/products_repository.dart';

class ProductRepositoyImpl implements ProductsRepository {
  final ProductRemoteDataSrc productRemoteDataSrc;

  const ProductRepositoyImpl({required this.productRemoteDataSrc});

  @override
  Future<Either<ApiErrorCommonEntity, List<ProductsEntity>>>
  fetchProducts() async {
    final response = await productRemoteDataSrc.getProducts();
    return response.fold((apiError) => Left(apiError), (productModel) {
      return Right(productModel);
    });
  }
}
