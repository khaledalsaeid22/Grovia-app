import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double cost;
  final String? imageUrl;
  final String categoryId;
  final String? storeId;
  final DateTime createdAt;
  final String merchantId;
  final double? rating;
  final double? discount;
  final String productLink;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.cost,
    this.imageUrl,
    required this.categoryId,
    this.storeId,
    required this.createdAt,
    required this.merchantId,
    this.rating,
    this.discount,
    required this.productLink,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? cost,
    String? imageUrl,
    String? categoryId,
    String? storeId,
    DateTime? createdAt,
    String? merchantId,
    double? rating,
    double? discount,
    String? productLink,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      cost: cost ?? this.cost,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      storeId: storeId ?? this.storeId,
      createdAt: createdAt ?? this.createdAt,
      merchantId: merchantId ?? this.merchantId,
      rating: rating ?? this.rating,
      discount: discount ?? this.discount,
      productLink: productLink ?? this.productLink,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    cost,
    imageUrl,
    categoryId,
    storeId,
    createdAt,
    merchantId,
    rating,
    discount,
    productLink,
  ];
  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, cost: $cost, imageUrl: $imageUrl, categoryId: $categoryId, storeId: $storeId, createdAt: $createdAt, marchantId: $merchantId, rating: $rating, discount: $discount, productLink: $productLink)';
  }
}
