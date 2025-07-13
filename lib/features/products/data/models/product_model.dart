import 'package:product_with_clean_arc/features/products/domain/entities/products.dart';

class ProductModel extends ProductsEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.category,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      category: json["category"],
      price: json["price"],
    );
  }

  factory ProductModel.entity(ProductsEntity productEntity) {
    return ProductModel(
      id: productEntity.id ?? -1,
      category: productEntity.category ?? "unkown",
      title: productEntity.title ?? "unknown",
      price: productEntity.price ?? 0.00,
    );
  }
}
