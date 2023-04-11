import 'package:get/get.dart';

import '../models/productModel.dart';

class ProductController extends GetxController {
  List<Product> products = <Product>[
    Product(
      productName: "Apple Watch Series 7",
      description: "Apple Watch Series 7 GPS + Cellular, 45mm Blue Aluminium Case with Abyss Blue Sport Band",
      image: "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MKUW3_VW_34FR+watch-45-alum-blue-cell-7s_VW_34FR_WF_CO?wid=1400&hei=1400&trim=1,0&fmt=p-jpg&qlt=95&.v=1632171100000,1631661588000",
      price: 51180,
      quantity: 1.obs,
      isAddedToCart: false.obs,
      isFavorite: false.obs,
    ),
    Product(
      productName: "Iphone 13 Pro Mex",
      description: "This phone come with 265gb storage",
      image: "https://m.media-amazon.com/images/I/61IJBsHm97L.jpg",
      price: 80990,
      quantity: 1.obs,
      isAddedToCart: false.obs,
      isFavorite: false.obs,
    ),
    Product(
      productName: "Nike shoes",
      description: "This shoes are stylish and created upgrading man fashion.",
      image:
          "https://static.nike.com/a/images/q_auto:eco/t_product_v1/f_auto/dpr_3.0/w_300,c_limit/092c245e-08c9-4c92-b45c-6d85c8f9059c/air-zoom-pegasus-39-womens-road-running-shoes-Wck51L.png",
      price: 23500,
      quantity: 1.obs,
      isAddedToCart: false.obs,
      isFavorite: false.obs,
    ),
    Product(
      productName: "JBL true Ear Buds",
      description: "good sound 3d effects",
      image: "https://m.media-amazon.com/images/I/51wnOfRKl6L._SY355_.jpg",
      price: 11999,
      quantity: 1.obs,
      isAddedToCart: false.obs,
      isFavorite: false.obs,
    ),
    Product(
      productName: "Apple Airpods Pro",
      description:
          "Magic like you’ve never heard AirPods Pro have been designed to deliver best sound",
      image:
          "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MWP22?wid=2000&hei=2000&fmt=jpeg&qlt=95&.v=1591634795000",
      price: 20999,
      quantity: 1.obs,
      isAddedToCart: false.obs,
      isFavorite: false.obs,
    ),
    Product(
      productName: "Samsung A-8",
      description: "Best high-end tablet from samsung",
      image:
          "https://myshop.pk/pub/media/catalog/product/cache/26f8091d81cea4b38d820a1d1a4f62be/s/a/samsung-galaxy-tab-a8-myshop-pk-1.jpg",
      price: 27000,
      quantity: 1.obs,
      isAddedToCart: false.obs,
      isFavorite: false.obs,
    ),
  ];

  RxList<Product> addToCart = <Product>[].obs;
  RxList<Product> favorite = <Product>[].obs;
  RxDouble totalPrice = 0.0.obs;

  addedToCartMethod({required Product e}) {
    if (products[products.indexOf(e)].isAddedToCart.isFalse) {
      products[products.indexOf(e)].isAddedToCart.value = true;
      addToCart.add(e);
    } else {
      addToCart[addToCart.indexOf(e)].quantity.value = 1;
      addToCart.remove(e);
      products[products.indexOf(e)].isAddedToCart.value = false;
    }
  }

  favoriteMethod({required Product e}) {
     
    if (products[products.indexOf(e)].isFavorite.isFalse) {
      products[products.indexOf(e)].isFavorite.value = true;
      favorite.add(e);
    } else {
      favorite.remove(e);
      products[products.indexOf(e)].isFavorite.value = false;
    }
  }

  quantityIncrement({required int index}) {
    addToCart[index].quantity.value++;
  }

  quantityDecrement({required int index}) {
    if(addToCart[index].quantity.value > 1) {
      addToCart[index].quantity.value--;
    }
  }

  totalPriceFinder(){
    totalPrice .value = 0;
    addToCart.forEach((e) {
      totalPrice.value += e.quantity * e.price;
    });
  }
}
