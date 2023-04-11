import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/controllers/ProductController.dart';
import '../controllers/themeController.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  final ThemeController themeController = Get.put(ThemeController());
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text("Product shop"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
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
      body: ListView(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 80),
        //physics: const BouncingScrollPhysics(),
        children: productController.products
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
                              backgroundColor: Colors.white,
                              onPressed: (){
                                productController.favoriteMethod(
                                    e: e);
                              },
                              elevation: 0,
                              mini: true,
                              child: Obx(
                                () => Icon(productController.products
                                        [productController.products.indexOf(e)]
                                        .isFavorite
                                        .isTrue
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_outline_rounded
                                ),
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.white,
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
                ))
            .toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width*0.5, 60),
          primary: Theme.of(context).textTheme.button!.color,
          onPrimary: Theme.of(context).backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Get.toNamed("favorite");
                },
                icon: const Icon(Icons.favorite_outline_rounded)),
            IconButton(
                onPressed: () {
                  Get.toNamed('add-to-cart');
                },
                icon: const Icon(Icons.shopping_bag_outlined)),
          ],
        ),
      ),
    );
  }
}
