
import 'package:expense_tracker/database/hive.dart';
import 'package:expense_tracker/utils/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {

  //all expense list
  List<ExpenseItem> overallexpense = []; 


  //get all expense list
  List<ExpenseItem> getAllExpenseData() {
  return overallexpense;
}

  final db= HiveDatabase();

  //add expense
  void addExpense(ExpenseItem expense) {
    overallexpense.add(expense);
    notifyListeners();
    db.saveData(overallexpense);
  }

  void deleteExpense(ExpenseItem expense) {
    overallexpense.remove(expense);
    notifyListeners();
    db.saveData(overallexpense);
  }

  //PREPARE DATA TO DISPLAY
  

  void prepareData() {
      overallexpense = db.readData();
      notifyListeners(); 
  }



  //Get Weekday
  String getDate(DateTime dateTime) {
    return dateTime.toString().split(' ')[0];
  }

  String getWeekDay(DateTime dateTime) {
    var day= dateTime.weekday;
    
    switch(day){
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  DateTime getLastSunday() {
    var now = DateTime.now();
    var lastSunday = DateTime(now.year, now.month, now.day - now.weekday);
    return lastSunday;
  }

  //get expense for each day

  Map<String, double> getExpenseForDay() {
    Map<String, double> map = {};
    for (var item in overallexpense) {
      if (map.containsKey(getDate(item.dateTime))) {
        map[getDate(item.dateTime)] = map[getDate(item.dateTime)]! + item.amount;
      } else {
        map[getDate(item.dateTime)] = item.amount;
      }
    }
    return map;
}


}