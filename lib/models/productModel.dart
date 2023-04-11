          import 'package:get/get.dart';

class Product {
  String productName;
  String description;
  String image;
  double price;
  RxInt quantity;
  RxBool isFavorite;
  RxBool isAddedToCart;

  Product({
    required this.productName,
    required this.description,
    required this.quantity,
    required this.image,
    required this.price,
    required this.isAddedToCart,
    required this.isFavorite,
  });
}
