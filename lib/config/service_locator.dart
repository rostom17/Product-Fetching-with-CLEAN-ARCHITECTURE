import 'package:get_it/get_it.dart';
import 'package:product_with_clean_arc/core/network_executor/error_mapper/default_error_mapper.dart';
import 'package:product_with_clean_arc/core/network_executor/network_executor.dart';
import 'package:product_with_clean_arc/core/network_executor/set_up_dio.dart';
import 'package:product_with_clean_arc/features/products/data/data_source/product_remote_data_src.dart';
import 'package:product_with_clean_arc/features/products/data/data_source/product_remote_data_src_impl.dart';
import 'package:product_with_clean_arc/features/products/data/repositories/product_repositoy_impl.dart';
import 'package:product_with_clean_arc/features/products/domain/repositories/products_repository.dart';
import 'package:product_with_clean_arc/features/products/domain/usecases/fetch_products_usecase.dart';
import 'package:product_with_clean_arc/features/products/presentation/bloc/product_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton(
    NetworkExecutor(DefaultErrorMapper(), dio: getDioInstance()),
  );

  serviceLocator.registerSingleton<ProductRemoteDataSrc>(
    ProductRemoteDataSrcImpl(networkExecutor: serviceLocator()),
  );

  serviceLocator.registerSingleton<ProductsRepository>(
    ProductRepositoyImpl(productRemoteDataSrc: serviceLocator()),
  );

  serviceLocator.registerSingleton(
    FetchProductsUsecase(productsRepository: serviceLocator()),
  );

  serviceLocator.registerFactory<ProductBloc>(() => ProductBloc());
  // serviceLocator.registerSingleton<ProductBloc>(ProductBloc());
}
