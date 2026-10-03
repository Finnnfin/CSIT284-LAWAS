import 'package:flutter/material.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({
    super.key,
    required this.total,
    required this.count,
  });

  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    final average = count == 0 ? 0 : total / count;

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'Total',
            value: '₱${total.toStringAsFixed(0)}',
            icon: Icons.account_balance_wallet_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: 'This Month',
            value: '₱${total.toStringAsFixed(0)}',
            icon: Icons.calendar_month_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            title: 'Average',
            value: '₱${average.toStringAsFixed(0)}',
            icon: Icons.analytics_outlined,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
             icon,
             color: Theme.of(context)
             .colorScheme
             .primary,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              value,
              style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(
                fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
      ),
    );
  }
}