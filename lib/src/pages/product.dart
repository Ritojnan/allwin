import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OpenFoodApiComponent extends StatefulWidget {
  final String barcode;

  const OpenFoodApiComponent({Key? key, required this.barcode})
      : super(key: key);

  @override
  _OpenFoodApiComponentState createState() => _OpenFoodApiComponentState();
}

class _OpenFoodApiComponentState extends State<OpenFoodApiComponent> {
  late Future<Map<String, dynamic>> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = fetchProduct(widget.barcode);
  }

  Future<Map<String, dynamic>> fetchProduct(String barcode) async {
    final url = Uri.parse(
        'https://world.openfoodfacts.org/api/v2/product/$barcode.json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data['status'] == 1) {
        return data['product'];
      } else {
        throw Exception('Product not found.');
      }
    } else {
      throw Exception('Failed to load product');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _productFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final product = snapshot.data!;
          return Column(
            children: [
              Text('Product Name: ${product['product_name']}'),
              Text('Brand: ${product['brands']}'),
              // Image.network(product['image_url'], width: 200, height: 200),
              // Add more information as needed
            ],
          );
        }
      },
    );
  }
}
