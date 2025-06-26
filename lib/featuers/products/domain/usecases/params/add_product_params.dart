import 'package:image_picker/image_picker.dart';

class AddProductParams {
  final String name;
  final String description;
  final double price;
  final double cost;
  final XFile? imageFile;
  final String categoryId;
  final String? storeId;
  final String merchantId;
  final double? rating;
  final double? discount;
  final String productLink;

  AddProductParams({
    required this.name,
    required this.description,
    required this.price,
    required this.cost,
    this.imageFile,
    required this.categoryId,
    this.storeId,
    required this.merchantId,
    this.rating,
    this.discount,
    required this.productLink,
  });
}
