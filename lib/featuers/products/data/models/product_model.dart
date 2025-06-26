import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.cost,
    super.imageUrl,
    required super.categoryId,
    super.storeId,
    required super.merchantId,
    required super.createdAt,
    super.rating,
    super.discount,
    required super.productLink,
  });

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      cost: product.cost,
      imageUrl: product.imageUrl,
      categoryId: product.categoryId,
      storeId: product.storeId,
      merchantId: product.merchantId,
      createdAt: product.createdAt,
      rating: product.rating,
      discount: product.discount,
      productLink: product.productLink,
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      categoryId: json['categoryId'] as String,
      storeId: json['storeId'] as String?,
      merchantId: json['merchantId'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      rating: (json['rating'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      productLink: json['productLink'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'cost': cost,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'storeId': storeId,
      'merchantId': merchantId,
      'createdAt': Timestamp.fromDate(createdAt),
      'rating': rating,
      'discount': discount,
      'productLink': productLink,
    };
  }
}
