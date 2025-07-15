import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_with_clean_arc/inection_container.dart';
import 'package:product_with_clean_arc/features/common/domain/entities/no_params.dart';
import 'package:product_with_clean_arc/features/products/domain/usecases/fetch_products_usecase.dart';
import 'package:product_with_clean_arc/features/products/presentation/bloc/product_events.dart';

class ProductBloc extends Cubit<ProductEvents> {
  ProductBloc() : super(ProductStateInitilized());

  Future<void> getAllProduct() async {
    emit(ProductStateFetchingLoading());

    final fetchProducts = serviceLocator<FetchProductsUsecase>();
    final response = await fetchProducts.call(NoParamsCommonEnity());

    response.fold(
      (l) => emit(ProductStateFetchingFailed(apiErrorMessage: l)),
      (r) => emit(ProductStateFetchingSuccessful(productsList: r)),
    );
  }
}
