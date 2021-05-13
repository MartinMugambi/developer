import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({
    this.categoryId,
    this.name,
    this.icon,
  });
}

final allCategory = Category(
  categoryId: 0,
  name: 'All',
  icon: Icons.storage_outlined,
);

final nearCategory = Category(
  categoryId: 1,
  name: "Near",
  icon: Icons.search,
);

final categories = [
  allCategory,
  nearCategory,
];
