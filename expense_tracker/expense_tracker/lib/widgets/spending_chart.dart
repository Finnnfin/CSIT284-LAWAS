import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class SpendingChart extends StatelessWidget{
  const SpendingChart({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  double dayTotal(DateTime day){
    double total = 0.0;

    for (final expense in expenses) {
      if (expense.date.day == day.day &&
          expense.date.month == day.month &&
          expense.date.year == day.year) {
          total += expense.amount;
      }
    }

    return total;
  }

  @override
  Widget build(BuildContext context){
     final today = DateTime.now();

     final days = List.generate(
      7, 
      (index) => DateTime(
        today.year,
        today.month,
        today.day - (6 - index),
      ),
     );

     double highest = 0;

     for (final day in days) {
      final amount = dayTotal(day);

      if (amount > highest) {
        highest = amount;
      }
     }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: days.map((day) {
        final amount = dayTotal(day);
        final height = highest == 0 ? 0.0 : amount / highest * 100;

        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                amount == 0 ? '₱0.00' : '₱${amount.toStringAsFixed(0)}',
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(height: 5),
              Container(
                width: 25,
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                [
                  'Mon',
                  'Tue',
                  'Wed',
                  'Thu',
                  'Fri',
                  'Sat',
                  'Sun',
                ][day.weekday - 1],
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}