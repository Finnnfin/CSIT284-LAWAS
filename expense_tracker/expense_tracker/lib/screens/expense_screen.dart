import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/responsive_layout.dart';
import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:expense_tracker/widgets/expense_summary.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({
    super.key,
    required this.isDark,
    required this.changeTheme,
  });

  final bool isDark;
  final VoidCallback changeTheme;


  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> expenses = [
  ];

  double get total {
    double result = 0;
 
  for(final expense in expenses){
    result += expense.amount;
  }

  return result; 
 }

 void showExpenseForm(){
  showModalBottomSheet(
    context: context,
  isScrollControlled: true,
  showDragHandle: true,
  builder: (context) {
    return ExpenseForm(onAddExpense: addExpense,
    );
  },
  );
 }
 
 void addExpense(Expense expense) {
  setState((){
    expenses.add(expense);
  });
 }
 
 void deleteExpense(Expense expense) {
  final index = expenses.indexOf(expense);

  setState(() {
    expenses.remove(expense);
  });
 
 ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('Expense deleted'),
    action: SnackBarAction(
      label: 'UNDO',
      onPressed: () {
        setState((){
          expenses.insert(index, expense);
        });
      },
    ),
  ),
 );
}

Widget buildSectionTitle() {
  return Row(
    children: [
      Text(
        'Recent Expenses',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      Text(
        '${expenses.length} items',
        style: Theme.of(context).textTheme.bodySmall,
        ),
    ],
  );
}

Widget buildMobileLayout() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        ExpenseSummary(
          total: total,
          count: expenses.length,
          ),
        const SizedBox(height: 16),
        buildSectionTitle(),
        const SizedBox(height: 8),
        Expanded(
          child: ExpenseList(
            expenses: expenses, 
            onDelete: deleteExpense,
          )
        ),
      ],
    ),
  );
}

Widget buildTabletLayout() {
  return Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 320,
              child: ExpenseSummary(
                total: total,
                count: expenses.length,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  buildSectionTitle(),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ExpenseList(
                      expenses: expenses,
                      onDelete: deleteExpense,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildLandscapeLayout() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          child: ExpenseSummary(
            total: total,
            count: expenses.length,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              buildSectionTitle(),
              const SizedBox(height: 8),
              Expanded(
                child: ExpenseList(
                  expenses: expenses,
                  onDelete: deleteExpense,
                ),
              ),
            ],
          ),
        ),
      ],
    )
  );
}


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Expense Tracker',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          onPressed: widget.changeTheme,
          icon: Icon(
            widget.isDark
            ? Icons.light_mode_outlined
            : Icons.dark_mode_outlined,
          ),
          tooltip: 'Change Theme',
        ),
      ],
    ),
    body: SafeArea(
      child: ResponsiveLayout(
        mobile: buildMobileLayout(),
        tablet: buildTabletLayout(),
        landscape: buildLandscapeLayout(),
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: showExpenseForm,
      icon: const Icon(Icons.add),
      label: const Text('Add Expense'),
    ),
  );
 }
}