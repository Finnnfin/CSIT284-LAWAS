import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.expense,
    required this.onDelete,
  });

  final Expense expense;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Padding (
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context)
                .colorScheme
                .primary
                .withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                expense.icon,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(width: 16.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '${expense.categoryName} • ${expense.date.month}/${expense.date.day}/${expense.date.year}',
                    style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ),
                ],
              ),
            ),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₱${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: const Icon(
                    Icons.delete_outline
                  ,size: 20.0,
                  ),
                  tooltip: 'Delete',
                ),
                
              ],
            ),
          ],
        ),
      ),
      );
  }
}