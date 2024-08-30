import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/database/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async{
  //HIVE SET UP
  await Hive.initFlutter();
  await Hive.openBox('expense_database');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>ExpenseData(),
      builder: (context, child)=> const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(), 
      )
    );
    }
  }
