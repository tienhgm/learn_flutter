import 'package:flutter/material.dart';
import 'package:flutter_app/models/expense.dart';
import 'package:flutter_app/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Beefsteak',
        amount: 20.99,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Workbook',
        amount: 14.99,
        date: DateTime.now(),
        category: Category.work),
  ];
  void _openAddExpenseOverlay() {
    //...
    showModalBottomSheet(
        // isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
     ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expense found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text('The chart'),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
