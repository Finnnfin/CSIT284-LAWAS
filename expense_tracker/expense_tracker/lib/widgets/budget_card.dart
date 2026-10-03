import 'package:flutter/material.dart';

class BudgetCard extends StatelessWidget {
  const BudgetCard({
    super.key,
    required this.total,
    required this.budget,
  });

  final double total;
  final double budget;

  @override
  Widget build(BuildContext context) {
    final progress = (total/budget).clamp(0.0, 1.0);
    final remaining = budget - total;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Monthly Budget',
              style: Theme.of(context)
              .textTheme
              .titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              '₱${total.toStringAsFixed(2)} / ₱${budget.toStringAsFixed(2)}',
              style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              remaining >=0
              ? 'Remaining: ₱${remaining.toStringAsFixed(2)}'
              : 'Over Budget: ₱${(-remaining).toStringAsFixed(2)}',
            ),
          ],
        ),
      ),
    );
  }
}