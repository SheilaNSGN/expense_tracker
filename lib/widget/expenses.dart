import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses_list/expense_list.dart';
import 'package:expense_tracker/widget/styled_text.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [];

  void _addExplanseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleText('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _addExplanseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const StyledText(
            'Chart',
          ),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
