import 'package:e_cart/screens/dashboard/productListPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar: AppBar(
          title: Text('E-Cart',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
          ),
          centerTitle: true,
          shadowColor: Colors.black,
          backgroundColor: Colors.grey,
          scrolledUnderElevation: 5.0,
        ),
        body: ProductListPage(),
      ),
    );
  }
}

