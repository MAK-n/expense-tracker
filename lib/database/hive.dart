
import 'package:expense_tracker/utils/expense_item.dart';
import 'package:hive/hive.dart';
class HiveDatabase {
  final mybox= Hive.box("expense_database");

  //SAVE DATA
  void saveData(List<ExpenseItem> allExpense) {

    List<List<dynamic>> allExpenseFormatted= [];

    for(var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.title,
        expense.amount,
        expense.dateTime,
      ];

      allExpenseFormatted.add(expenseFormatted);
    }
    mybox.put("ALL_EXPENSE", allExpenseFormatted);

  }
     
  List<ExpenseItem> readData(){

    List savedExpenses= mybox.get("ALL_EXPENSE") ?? [];
    List<ExpenseItem> overallexpense = [];

    for(int i=0; i<savedExpenses.length; i++) {
      overallexpense.add(ExpenseItem(
        title: savedExpenses[i][0],
        amount: savedExpenses[i][1],
        dateTime: savedExpenses[i][2],
      ));
    }
    return overallexpense;
  }

}

