import 'package:expense_tracker/database/expense_data.dart';
import 'package:expense_tracker/utils/drawer.dart';
import 'package:expense_tracker/utils/expense_item.dart';
import 'package:expense_tracker/utils/expense_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _titleController = TextEditingController();
  final _expenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }
  
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        surfaceTintColor: Colors.grey[800],
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Expense Title'
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _expenseAmountController,
              decoration: InputDecoration(
                hintText: 'Amount'
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _titleController.clear();
              _expenseAmountController.clear();
              Navigator.pop(context);
            },
            child: Text('Cancel', style: TextStyle(color: Colors.grey[800]),)
          ),
          TextButton(
            onPressed: () {
              save();
              _titleController.clear();
              _expenseAmountController.clear();
              Navigator.pop(context);
              
            },
            child: Text('Add',style: TextStyle(color: Colors.grey[800]),)
          ),
        ],
      )
    );
  }

  void save() {
    final title = _titleController.text;
    final amount = _expenseAmountController.text;

    if (title.isNotEmpty || amount.isNotEmpty) {
    ExpenseItem newExpense = ExpenseItem(
      title: title,
      amount: double.parse(amount),
      dateTime: DateTime.now(),
    );

    Provider.of<ExpenseData>(context, listen: false).addExpense(newExpense);
  }
}

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context,value,child)=> Scaffold(
        appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        ),
        drawer: CustomDrawer(),
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: Colors.grey[800],
          elevation: 0,
          foregroundColor: Colors.grey[300],
          child: const Icon(Icons.add),
        ),
        body: Slidable(
          child: ListView(
            children:[

              const SizedBox(height: 50,),
              //expense graph

              Consumer<ExpenseData>(
                builder: (context, value, child) => ExpenseSummary(
                  startOfTheWeek: value.getLastSunday(),
                ),
              ),

          
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.overallexpense.length,
                  itemBuilder: (context,index)=> 
                  Slidable(
                    endActionPane:  ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context)=> Provider.of<ExpenseData>(context, listen: false).deleteExpense(value.overallexpense[index]),
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(value.overallexpense[index].title,style:const TextStyle(fontWeight: FontWeight.bold,color: Colors.black87),),
                      //display amount
                      trailing: Text('\u{20B9}${value.overallexpense[index].amount.toString()}'),
                      subtitle: Text(value.getDate(value.overallexpense[index].dateTime)),
                    ),
                  ),
              ),
            ]
          ),
        ),
      )
      );
  }
}