import 'dart:convert';
import 'dart:async';

import 'package:fashion/model/category.dart';
import 'package:flutter/services.dart';

class Product {
  final int id;
  final String name, image;
  final double price, rating;
  final CategoryEnum category;

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

  static CategoryEnum _stringToCategory(String categoryString) {
    switch (categoryString.toLowerCase()) {
      case 'all':
        return CategoryEnum.all;
      case 'accessories':
        return CategoryEnum.accessories;
      case 'clothes':
        return CategoryEnum.clothes;
      case 'shoes':
        return CategoryEnum.shoes;
      case 'hats':
        return CategoryEnum.hats;
      default:
        throw Exception('Categoria não reconhecida: $categoryString');
    }
  }
}


