import 'package:flutter/material.dart';

enum Category {
  food,
  transport,
  shopping,
  bills, 
  entertainment,
  other,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  final String title;
  final double amount;
  final DateTime date;
  final Category category;


IconData get icon {
    switch (category) {
      case Category.food:
        return Icons.restaurant;
      case Category.transport:
        return Icons.directions_car;
      case Category.shopping:
        return Icons.shopping_cart;
      case Category.bills:
        return Icons.receipt;
      case Category.entertainment:
        return Icons.movie;
      case Category.other:
        return Icons.more_horiz;
    }
  }

  String get CategoryName {
    switch (category) {
      case Category.food:
        return 'Food';
      case Category.transport:
        return 'Transport';
      case Category.shopping:
        return 'Shopping';
      case Category.bills:
        return 'Bills';
      case Category.entertainment:
        return 'Entertainment';
      case Category.other:
        return 'Other';
    }
  }
}