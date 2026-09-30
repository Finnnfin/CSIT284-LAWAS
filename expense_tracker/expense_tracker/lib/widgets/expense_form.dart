import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    super.key, 
  required this.onAddExpense,
  });

  final void Function(Expense expense) onAddExpense;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Category selectedCategory = Category.food;

  @override 
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void openDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

void addExpense() {
  final title = titleController.text.trim();
  final amount = double.tryParse(amountController.text);

  if (title.isEmpty || amount == null || amount <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter a valid title and amount.'),
      ),
    );
    return;
  }

  final expense = Expense(
    title: title,
    amount: amount,
    date: selectedDate,
    category: selectedCategory,
  );

  widget.onAddExpense(expense);
  titleController.clear();
  amountController.clear();

  Navigator.of(context).pop(); // Close the form after adding the expense
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Expense',
              style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16.0),

            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Expense Title',
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            
            const SizedBox(height: 16.0),
            
            TextField(
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Amount',
                prefixText: '₱',
                prefixIcon: Icon(Icons.payments_outlined),
              ),
            ),


            const SizedBox(height: 16.0),


            DropdownButtonFormField<Category>(
              initialValue: selectedCategory,
             decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category_outlined),
              ),
              items: Category.values.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(
                    Expense(
                      title: '',
                      amount: 0,
                      date: DateTime.now(),
                      category: category,
                    ).categoryName,
                    ),
                    );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                }
              },
            ),

            const SizedBox(height: 16.0),

            InkWell(
              onTap: openDatePicker,
              borderRadius: BorderRadius.circular(14),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Date',
                  prefixIcon: Icon(Icons.calendar_month),
                ),
                child: Text(
                  '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                ),
              ),
            ),
           
           const SizedBox(height: 24),

           SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: addExpense,
              icon: const Icon(Icons.add),
              label: const Text(
                'Add Expense',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
           )

          ],
        ),
      ),
    );
  }
}
