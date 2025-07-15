import 'package:dartz/dartz.dart';
import 'package:product_with_clean_arc/core/network/models/network_requset_model.dart';
import 'package:product_with_clean_arc/core/network/network_executor.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/api_error.dart';
import 'package:product_with_clean_arc/features/products/data/data_source/product_remote_data_src.dart';
import 'package:product_with_clean_arc/features/products/data/models/product_model.dart';

class ProductRemoteDataSrcImpl implements ProductRemoteDataSrc {
  final NetworkExecutor networkExecutor;

  const ProductRemoteDataSrcImpl({required this.networkExecutor});

  @override
  Future<Either<ApiErrorCommonEntity, List<ProductModel>>> getProducts() async {
    final response = await networkExecutor.getRequest(
      NetworkRequsetModel(path: "/products"),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<ProductModel> productsList = [];

      for (Map<String, dynamic> products in response.bodyData["products"]) {
        productsList.add(ProductModel.fromJson(products));
      }

      return Right(productsList);
    } else {
      return Left(ApiErrorCommonEntity(errorMessage: response.message));
    }
  }
}
