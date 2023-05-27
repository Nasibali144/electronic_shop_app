import 'package:electronic_shop_app/services/exceptions/product_exceptions.dart';

class Product {
  int id;
  String title;
  String description;
  double rating;
  double price;
  bool isLike;
  List<String> colors;
  List<String> images;

  Product._({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.isLike,
    required this.colors,
    required this.images,
  });

  factory Product({
    required int id,
    required String title,
    required String description,
    required double rating,
    required double price,
    required bool isLike,
    required List<String> colors,
    required List<String> images,
  }) {
    if(colors.isEmpty) {
      throw ProductException(message: "Colors must be not empty!!!");
    }

    if(!(images.length >= 4)) {
      throw ProductException(message: "Images must be length more then four!!!");
    }

    return Product._(id: id, title: title, description: description, rating: rating, price: price, isLike: isLike, colors: colors, images: images);
  }

  @override
  String toString() {
    return 'Product{title: $title, description: $description, rating: $rating, price: $price, isLike: $isLike}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => Object.hash(id, title);
}
