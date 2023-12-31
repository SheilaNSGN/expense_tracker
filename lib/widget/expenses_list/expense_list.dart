import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(
          ExpensesItem(
            expenses[index],
          ),
        ),
        onDismissed: (direction) => ExpensesItem(
          expenses[index],
        ),
        child: ExpensesItem(
          expenses[index],
        ),
      ),
    );
  }
}
