import 'package:flutter/material.dart';
import 'package:flutter_app/models/expense.dart';
import 'package:flutter_app/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: expenses.length,
        itemBuilder: (context, idx) => Dismissible(
            key: ValueKey(expenses[idx]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[idx]);
            },
            child: ExpenseItem(expenses[idx])));
  }
}
