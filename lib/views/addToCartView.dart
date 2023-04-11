import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/controllers/ProductController.dart';
import '../controllers/themeController.dart';

class AddToCartView extends StatefulWidget {
  const AddToCartView({Key? key}) : super(key: key);

  @override
  State<AddToCartView> createState() => _AddToCartViewState();
}

class _AddToCartViewState extends State<AddToCartView> {
  final ProductController productController = Get.put(ProductController());
  final ThemeController themeController = Get.put(ThemeController());
  @override
  initState(){
    super.initState();
    productController.totalPriceFinder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text("Add To Cart"),
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
      body: Obx(()=>ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        physics: const BouncingScrollPhysics(),
        children: productController.addToCart
            .map((e) => Container(
          margin: const EdgeInsets.only(bottom: 10),
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                      ),
                      child: Image.network(
                        e.image,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.productName,style:  const TextStyle( fontSize: 18, fontWeight: FontWeight.w500),),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(e.price.toString(),style:  const TextStyle( fontSize: 18, fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Colors.white,
                height: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 10,top: 5,bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FloatingActionButton(
                        backgroundColor:
                        Colors.white,
                        onPressed: () {
                          productController.quantityIncrement(
                              index: productController.addToCart
                                  .indexOf(e));
                          productController.totalPriceFinder();
                        },
                        elevation: 0,
                        mini: true,
                        child: const Icon(Icons.add)),
                    const SizedBox(
                      width: 10,
                    ),
                    Obx(() => Text(e.quantity.value.toString(),style:  const TextStyle( fontSize: 18, fontWeight: FontWeight.w500),)),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                        backgroundColor:
                       Colors.white,
                        onPressed: () {
                          productController.quantityDecrement(
                              index: productController.addToCart
                                  .indexOf(e));
                          productController.totalPriceFinder();
                        },
                        elevation: 0,
                        mini: true,
                        child: const Icon(Icons.remove)),
                    const Spacer(),
                    TextButton(
                      onPressed: (){
                        productController.addedToCartMethod(e: e);
                        productController.totalPriceFinder();
                      },
                      style: TextButton.styleFrom(
                          primary:
                          Theme.of(context).textTheme.button!.color,
                          fixedSize: const Size(100, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      child: const Text(
                        "Remove",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
            .toList(),
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        width: MediaQuery.of(context).size.width-30,
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).appBarTheme.backgroundColor,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => Text("Products : ${productController.addToCart.length}", style:  const TextStyle( fontSize: 18, fontWeight: FontWeight.w500),),),
                Obx(() => Text("Total Price : ${productController.totalPrice.value}",style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),),
              ],
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                elevation: 1,
                primary: Theme.of(context).textTheme.button!.color,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: const Text("Buy Now"),

            ),
          ],
        ),
      ),
    );
  }
}
