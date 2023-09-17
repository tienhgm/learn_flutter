import 'package:flutter/material.dart';
import 'package:flutter_app/expense.dart';

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
        title: 'Flutter course',
        amount: 20.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Workbook',
        amount: 14.99,
        date: DateTime.now(),
        category: Category.work),
  ];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('The chart'),
          Text('Expenses list...'),
        ],
      ),
    );
  }
}
