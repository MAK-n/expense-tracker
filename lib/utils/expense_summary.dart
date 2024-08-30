import 'package:expense_tracker/bargraph/bar_graph.dart';
import 'package:expense_tracker/database/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  
  final DateTime startOfTheWeek;

  ExpenseSummary({super.key, required this.startOfTheWeek});
  

  @override
  Widget build(BuildContext context) {

    ExpenseData expenseData= ExpenseData();

    String sunday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 0)),
    );
    String monday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 1)),
    );
    String tuesday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 2)),
    );
    String wednesday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 3)),
    );
    String thursday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 4)),
    );
    String friday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 5)),
    );
    String saturday= expenseData.getDate(
      startOfTheWeek.add(const Duration(days: 6)),
    );




    
return Consumer<ExpenseData>(
  builder: (context, value, child) {

    // CALCULATING MAX AMOUNT OF THE WEEK
    List<double> allAmounts = [
      value.getExpenseForDay()[monday] ?? 0,
      value.getExpenseForDay()[tuesday] ?? 0,
      value.getExpenseForDay()[wednesday] ?? 0,
      value.getExpenseForDay()[thursday] ?? 0,
      value.getExpenseForDay()[friday] ?? 0,
      value.getExpenseForDay()[saturday] ?? 0,
      value.getExpenseForDay()[sunday] ?? 0,
    ];
    allAmounts.sort();
    double maxAmount = allAmounts.last;

    // DISPLAYING BARGRAPH
    return SizedBox(
      height: 200,
      child: MyBarGraph(
        maxY: maxAmount*1.5,
        monAmt: ((value.getExpenseForDay()[monday] ?? 0)),
        tueAmt: ((value.getExpenseForDay()[tuesday] ?? 0)),
        wedAmt: ((value.getExpenseForDay()[wednesday] ?? 0)),
        thuAmt: ((value.getExpenseForDay()[thursday] ?? 0)),
        friAmt: ((value.getExpenseForDay()[friday] ?? 0)),
        satAmt: ((value.getExpenseForDay()[saturday] ?? 0)),
        sunAmt: ((value.getExpenseForDay()[sunday] ?? 0)),
      ),
    );
  },
);
}
}