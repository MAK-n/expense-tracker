import 'package:expense_tracker/bargraph/individual_bar.dart';


class BarGraphData{
  
  final double monAmt;
  final double tueAmt;
  final double wedAmt;
  final double thuAmt;
  final double friAmt;
  final double satAmt;
  final double sunAmt;

  BarGraphData({
    required this.monAmt,
    required this.tueAmt,
    required this.wedAmt,
    required this.thuAmt,
    required this.friAmt,
    required this.satAmt,
    required this.sunAmt
    });

  List <IndividualBar> barData=[];

  void initializeBarData(){
    barData=[
      IndividualBar(x: 0, y: monAmt),
      IndividualBar(x: 1, y: tueAmt),
      IndividualBar(x: 2, y: wedAmt),
      IndividualBar(x: 3, y: thuAmt),
      IndividualBar(x: 4, y: friAmt),
      IndividualBar(x: 5, y: satAmt),
      IndividualBar(x: 6, y: sunAmt),
    ];
  }
}