import 'package:dartz/dartz.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/api_error.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/no_params.dart';
import 'package:product_with_clean_arc/features/common/domain/usecases/usecase.dart';
import 'package:product_with_clean_arc/features/products/domain/entities/products.dart';
import 'package:product_with_clean_arc/features/products/domain/repositories/products_repository.dart';

class FetchProductsUsecase
    implements
        UsecaseCommon<
          Either<ApiErrorCommonEntity, List<ProductsEntity>>,
          NoParamsCommonEnity
        > {
  final ProductsRepository productsRepository;
  FetchProductsUsecase({required this.productsRepository});

  @override
  Future<Either<ApiErrorCommonEntity, List<ProductsEntity>>> call(
    NoParamsCommonEnity params,
  ) async {
    return await productsRepository.fetchProducts();
  }
}
