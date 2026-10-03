import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class CategoryBreakdown extends StatelessWidget {
  const CategoryBreakdown({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  double categoryTotal(Category category) {
    double total = 0.0;

    for (final expense in expenses) {
      if (expense.category == category) {
        total += expense.amount;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Spending by Category',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...Category.values.map((category) {
              final amount = categoryTotal(category);

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  children: [
                    Icon(
                      Expense(
                        title: '',
                        amount: 0,
                        date: DateTime.now(),
                        category: category,
                      ).icon,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        Expense(
                          title: '',
                          amount: 0,
                          date: DateTime.now(),
                          category: category,
                        ).categoryName,
                      ),
                    ),
                    Text(
                      '₱${amount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
