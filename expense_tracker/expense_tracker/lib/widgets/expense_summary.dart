import 'package:flutter/material.dart';

class ExpenseSummary extends StatelessWidget {
  const ExpenseSummary({
    super.key,
    required this.total,
    required this.count,
    });
    
    final double total;
    final int count;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: Theme.of(context)
                .colorScheme
                .primary
                .withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Icon(
                Icons.account_balance_wallet,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),

            const SizedBox(width: 16.0),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Expenses',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '\₱${total.toStringAsFixed(2)}',
                    style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              children: [
                Text(
                  '$count',
                  style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Expenses',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),  
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}