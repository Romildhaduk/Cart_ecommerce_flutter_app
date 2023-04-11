import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_ecommerce/views/addToCartView.dart';
import 'package:getx_ecommerce/views/favoriteview.dart';
import 'package:getx_ecommerce/views/homeview.dart';

import 'controllers/themeController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffF5F8FE),

        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
        ),

        textTheme:  const TextTheme(
          button:  TextStyle(color: Color(0xff1C2754)),
          bodyText2:  TextStyle(color: Color(0xff141D3C)),
        )

      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff141D3C),
        appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Color(0xff1C2754)
        ),

          textTheme: const TextTheme(
            button:  TextStyle(color: Color(0xff6B84F5)),
            bodyText2:  TextStyle(color: Color(0xffF5F8FE)),
          )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomeView(),
        'favorite': (context) => const FavoriteView(),
        'add-to-cart': (context) => const AddToCartView(),
      },
    );
  }
}
