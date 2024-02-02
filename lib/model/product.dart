import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name, image;
  final double price, rating;
  final Category category;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.rating,
      required this.category,
      required this.image});

  static List<Product> allProducts = [];

  static Future<void> initProducts() async {
      String jsonString =
          await rootBundle.loadString('assets/productsRepository.json');
      List<dynamic> jsonList = jsonDecode(jsonString);
      allProducts = jsonList.map((json) => Product.fromJson(json)).toList();

  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      category: _stringToCategory(json['category']),
      image: json['image'],
      rating: json['rating'].toDouble(),
    );
  }

  static Category _stringToCategory(String categoryString) {
    switch (categoryString.toLowerCase()) {
      case 'all':
        return Category.all;
      case 'accessories':
        return Category.accessories;
      case 'clothes':
        return Category.clothes;
      case 'shoes':
        return Category.shoes;
      case 'hats':
        return Category.hats;
      default:
        throw Exception('Categoria não reconhecida: $categoryString');
    }
  }
}

enum Category { all, accessories, clothes, shoes, hats }
