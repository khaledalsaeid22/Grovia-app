import 'package:image_picker/image_picker.dart';
import 'package:grovia/featuers/products/domain/entities/product.dart';

class UpdateProductParams {
  final String id;
  final String? name;
  final String? description;
  final double? price;
  final double? cost;
  final XFile? newImageFile;
  final String? existingImageUrl;
  final String? categoryId;
  final String? storeId;
  final String? merchantId;
  final double? rating;
  final double? discount;
  final String? productLink;

  UpdateProductParams({
    required this.id,
    this.name,
    this.description,
    this.price,
    this.cost,
    this.newImageFile,
    this.existingImageUrl,
    this.categoryId,
    this.storeId,
    this.merchantId,
    this.rating,
    this.discount,
    this.productLink,
  });

  // دالة لتحويل الـ params لـ Product entity (للتعديل)
  Product toProductEntity(Product currentProduct) {
    return currentProduct.copyWith(
      name: name,
      description: description,
      price: price,
      cost: cost,
      imageUrl: newImageFile != null
          ? null
          : (existingImageUrl ?? currentProduct.imageUrl),
      categoryId: categoryId,
      storeId: storeId,
      merchantId: merchantId,
      rating: rating,
      discount: discount,
      productLink: productLink,
    );
  }
}
