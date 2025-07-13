import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_with_clean_arc/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_with_clean_arc/features/products/presentation/bloc/product_events.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          productBloc.getAllProduct();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ProductBloc, ProductEvents>(
      builder: (context, state) {
        if (state is ProductStateInitilized) {
          return Center(child: Text("Click button to fetch users"));
        } else if (state is ProductStateFetchingLoading) {
          return Center(child: LinearProgressIndicator());
        } else if (state is ProductStateFetchingFailed) {
          return Center(child: Text("Faild.! : ${state.apiErrorMessage}"));
        } else if (state is ProductStateFetchingSuccessful) {
          return ListView.builder(
            itemCount: state.productsList.length,
            itemBuilder: (context, index) {
              final product = state.productsList[index];
              return Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text("${product.title}"),
                    Text("${product.category}"),
                    Text("${product.price}"),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(child: Text("Unkown Problem Occured "));
        }
      },
    );
  }
}
