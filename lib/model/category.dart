import 'package:fashion/util/components.dart';
import 'package:flutter/material.dart';

class Category {
  String name;

  Category(this.name);

  static List<Category> allCategories = [];

  static initCategories() {
    allCategories = CategoryEnum.values.map((categoryEnum) {
      String categoryName = categoryEnum.toString().split('.').last;
      categoryName = categoryName[0].toUpperCase() + categoryName.substring(1);

      return Category(categoryName);
    }).toList();
  }

  static List<Padding> categoriesButtons() {
    bool _isFirst = true;
    return allCategories.map((category) {
      final padding = _isFirst
          ? const EdgeInsets.fromLTRB(10, 0, 5, 0)
          : const EdgeInsets.symmetric(horizontal: 5);

      _isFirst = false;

      return Padding(
        padding: padding,
        child: CategoryButton(icon: Icons.category, name: category.name),
      );
    }).toList();
  }
}

enum CategoryEnum { all, accessories, clothes, shoes, hats }
