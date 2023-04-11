import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/controllers/ProductController.dart';
import '../controllers/themeController.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {

  final ProductController productController = Get.put(ProductController());
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Favorite"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search_rounded)),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).textTheme.bodyText2!.color,
              radius: 13,
              child: InkWell(
                onTap: () {
                  themeController.changeTheme();
                },
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).textTheme.button!.color,
                  radius: 12,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(() => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        physics: const BouncingScrollPhysics(),
        children: productController.favorite
            .map((e) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 110,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                offset: const Offset(0, 0),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  child: Image.network(
                    e.image,
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.productName,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  const SizedBox(
                    height: 5,
                  ),
                  Text("₹${e.price}",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor:
                      Colors.white,
                      onPressed: (){
                        productController.favoriteMethod(
                            e: e);
                      },
                      elevation: 0,
                      mini: true,
                      child:  const Icon(Icons.remove),

                    ),
                    FloatingActionButton(
                      backgroundColor:
                      Colors.white,
                      onPressed: () {
                        productController.addedToCartMethod(
                            e: e);
                      },
                      elevation: 0,
                      mini: true,
                      child: Obx(
                            () => Icon(productController.products
                        [productController.products.indexOf(e)]
                            .isAddedToCart
                            .isTrue
                            ? Icons.shopping_bag_rounded
                            : Icons.shopping_bag_outlined),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )).toList(),
      ),),
    );
  }
}
