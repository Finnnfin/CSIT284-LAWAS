import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_card.dart';
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
    Expense(
      title: 'Lunch',
      amount: 150,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Bus Faire',
      amount: 50,
      date: DateTime.now(),
      category: Category.transport,
    ),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ExpenseSummary(
              total: total,
              count: expenses.length,
            ),

            const SizedBox(height: 20),
            
            Row(
              children: [
                Text(
                  'Recent Expenses',
                  style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '${expenses.length} items',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
            ),
            const SizedBox(height: 12),

            Expanded(
              child: expenses.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 70,
                    color: Theme.of(context)
                    .colorScheme
                    .primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No expenses yet',
                    style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Tap the + button to add your first expense.',
                    textAlign: TextAlign.center,
                  ),
                ],
               ),
              )
              : ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final expense = expenses[index];

                  return Dismissible(
                    key: ValueKey(expense),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (_) {
                      deleteExpense(expense);
                    },
                    child: ExpenseCard(
                      expense: expense,
                      onDelete: (){
                        deleteExpense(expense);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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