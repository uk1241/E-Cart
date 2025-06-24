// Import required packages
import 'dart:convert'; // For decoding JSON
import 'package:e_cart/model/products.dart';
import 'package:flutter/material.dart'; // Flutter UI framework
import 'package:http/http.dart' as http; // For making HTTP requests

// Main widget for displaying the product list
class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

// State class for ProductListPage
class _ProductListPageState extends State<ProductListPage> {
  // A future that will hold the list of products
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    // Initialize the future when the widget is first created
    products = fetchProducts();
  }

  // Function to fetch products from the API
  Future<List<Product>> fetchProducts() async {
    // Make a GET request to the API
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    // Check if the response is successful
    if (response.statusCode == 200) {
      // Decode the JSON response into a List of dynamic objects
      List<dynamic> data = json.decode(response.body);
      // Convert each item into a Product model and return the list
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      // If the request failed, throw an error
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use FutureBuilder to wait for the Future to complete and build UI accordingly
      body: FutureBuilder<List<Product>>(
        future: products, // The future to wait for
        builder: (context, snapshot) {
          // Show a loading spinner while waiting for the data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          // Show an error message if there was an error
          else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          // When data is available, build the list
          else {
            final items = snapshot.data!; // Extract the product list
            return ListView.builder(
              itemCount: items.length, // Total number of items
              itemBuilder: (context, index) {
                final product = items[index]; // Get product at current index
                return ListTile(
                  leading: Image.network(product.image, width: 50, height: 50), // Product image
                  title: Text(product.title), // Product title
                  subtitle: Text("\$${product.price}"), // Product price
                );
              },
            );
          }
        },
      ),
    );
  }
}