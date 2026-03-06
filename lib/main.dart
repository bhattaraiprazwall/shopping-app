import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';
import 'package:shop_app/product_detail_page.dart';
import 'package:shop_app/global_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return MaterialApp(
      title: 'Shopping App',
      home: ProductDetailPage(product: products[0],),
      
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
