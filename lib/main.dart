import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_with_clean_arc/inection_container.dart';
import 'package:product_with_clean_arc/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_with_clean_arc/features/products/presentation/screens/product_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (_) => serviceLocator<ProductBloc>()),
      ],
      child: MaterialApp(home: ProductScreen()),
    );
  }
}
