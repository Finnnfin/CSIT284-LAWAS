import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/responsive_layout.dart';
import 'package:expense_tracker/widgets/expense_form.dart';
import 'package:expense_tracker/widgets/budget_card.dart';
import 'package:expense_tracker/widgets/stats_cards.dart';
import 'package:expense_tracker/widgets/spending_chart.dart';
import 'package:expense_tracker/widgets/category_breakdown.dart';

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
  
  final TextEditingController searchController = TextEditingController();

  String selectedFilter = 'All';

  double budget = 5000;

  double get total {
    double result = 0;
 
  for(final expense in expenses){
    result += expense.amount;
  }

  return result; 
 }

 List<Expense> get filteredExpenses {
  List<Expense> result = List.from(expenses);
  if (selectedFilter != 'All') {
    result = result.where((expense) {
      return expense.category.name == selectedFilter;
    }).toList();
  }

  if(searchController.text.isNotEmpty){
    result = result.where((expense) {
      return expense.title
      .toLowerCase()
      .contains(searchController.text.toLowerCase());
    }).toList();
  }
  return result;
 }
 
 @override
 void dispose() {
  searchController.dispose();
  super.dispose();
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

void showSettings() {
  final controller = TextEditingController(text: budget.toStringAsFixed(0));

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Settings'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Budget',
                prefixText: '₱',
              ),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dark Mode'),
              value: widget.isDark,
              onChanged: (_) {
                Navigator.of(context).pop();
                widget.changeTheme();
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final value = double.tryParse(controller.text);

              if (value != null && value > 0) {
                setState(() {
                  budget = value;
                });
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a valid budget.'),
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),
        ]
      );
    }

  );
}

Widget buildSearchandFilter() {
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: searchController,
          onChanged: (_) {
            setState(() {});
          },
          decoration: const InputDecoration(
            labelText: 'Search expenses...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      const SizedBox(width: 12),
      DropdownButton<String>(
        value: selectedFilter,
        items: [
          'All',
          'Food',
          'Transport',
          'Shopping',
          'Entertainment',
          'Bills',
          'Other',
        ].map((filter) {
          return DropdownMenuItem<String>(
            value: filter,
            child: Text(filter),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null){
            setState(() {
              selectedFilter = value;
            });
          }
        },
      ),
    ],
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
        '${filteredExpenses.length} items',
        style: Theme.of(context).textTheme.bodySmall,
        ),
    ],
  );
}

Widget buildMobileLayout() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        StatsCards(
          total: total,
          count: expenses.length,
          ),

        const SizedBox(height: 16),

        BudgetCard(
          total: total,
         budget: budget
         ),

        const SizedBox(height: 16),
        
        CategoryBreakdown(expenses: expenses),

        const SizedBox(height: 16),

        SpendingChart(expenses: expenses),

        const SizedBox(height: 20),

        buildSearchandFilter(),

        const SizedBox(height: 20),

        buildSectionTitle(),

        const SizedBox(height: 12),

        SizedBox(
          height: 400,
          child: ExpenseList(
            expenses: filteredExpenses,
            onDelete: deleteExpense,
          ),
        ),
        const SizedBox(height: 80),
      ],
    ),
  );
}

Widget buildTabletLayout() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1200
          ),
        child: Column(
          children: [
            StatsCards(
              total: total,
              count: expenses.length,
            ),
            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      BudgetCard(
                        total: total,
                        budget: budget,
                      ),
                      const SizedBox(height: 16),
                      CategoryBreakdown(
                        expenses: expenses
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),

                Expanded(
                  child: Column(
                    children: [
                      SpendingChart(expenses: expenses),
                      const SizedBox(height: 16),
                      buildSearchandFilter(),
                      const SizedBox(height: 16),
                      buildSectionTitle(),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 400,
                        child: ExpenseList(
                          expenses: filteredExpenses,
                          onDelete: deleteExpense,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    ),
  );
}

Widget buildLandscapeLayout() {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              StatsCards(
                total: total,
                count: expenses.length,
              ),
              const SizedBox(height: 16),
              BudgetCard(
                total: total,
                budget: budget,
              ),
              const SizedBox(height: 16),
              CategoryBreakdown(expenses: expenses),
              const SizedBox(height: 16),
              SpendingChart(expenses: expenses),
            ],
          ),
        ),

        const SizedBox(width: 24),

        Expanded(
          flex: 3,
          child: Column(
            children: [
              buildSearchandFilter(),
              const SizedBox(height: 20),
              buildSectionTitle(),
              const SizedBox(height: 12),

              SizedBox(
                height: 500,
                child: ExpenseList(
                  expenses: filteredExpenses,
                  onDelete: deleteExpense,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
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
        IconButton(
          onPressed: showSettings,
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Settings',
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