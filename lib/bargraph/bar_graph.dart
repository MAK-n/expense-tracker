import 'package:expense_tracker/bargraph/bar_graph_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {

  final double? maxY;
  final double monAmt;
  final double tueAmt;
  final double wedAmt;
  final double thuAmt;
  final double friAmt;
  final double satAmt;
  final double sunAmt;


  const MyBarGraph({
    super.key,
    this.maxY,
    required this.monAmt,
    required this.tueAmt,
    required this.wedAmt,
    required this.thuAmt,
    required this.friAmt,
    required this.satAmt,
    required this.sunAmt,
    });


  
  @override
  Widget build(BuildContext context) {

    //initialize the bar data
    BarGraphData MyBarData= BarGraphData(
      monAmt: monAmt,
      tueAmt: tueAmt,
      wedAmt: wedAmt,
      thuAmt: thuAmt,
      friAmt: friAmt,
      satAmt: satAmt,
      sunAmt: sunAmt,
      );
    MyBarData.initializeBarData();
    
    double maxVal=0;
    for(var data in MyBarData.barData){
      if(data.y>maxVal){
        maxVal=data.y;
      }
    }

    return BarChart(
      BarChartData(
        maxY: maxVal*1.2,
        minY: 0,
        barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (BarChartGroupData group) => Colors.grey[300]!,
        )
      ),

        /*BARGRAPH APPEARENCE*/
        titlesData: const FlTitlesData(
          show: true,
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
            )
          )  
        ),
        gridData: const FlGridData(
          show: false
        ),
        borderData: FlBorderData(
          show: false,
        ),


        barGroups: MyBarData.barData.map(
          (data) => BarChartGroupData(
            x: data.x,
            barRods: [
              BarChartRodData(
                toY: data.y, 
                color: Colors.grey[800],
                backDrawRodData: BackgroundBarChartRodData(
                  show: true,
                  toY:  maxVal*1.2,
                  color: Colors.grey[200],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  
                ),
                width: 25,
              )
            ],
          ),
          
      ).toList(),
    )
  ); 
   
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 10
  );
  Widget text= const Text(" ",style: style,);

  switch (value.toInt()) {
    case 0:
      text = const Text('Mon', style: style);
      break;
    case 1:
      text = const Text('Tue', style: style);
      break;
    case 2:
      text = const Text('Wed', style: style);
      break;
    case 3:
      text = const Text('Thur', style: style);
      break;
    case 4:
      text = const Text('Fri', style: style);
      break;
    case 5: 
      text = const Text('Sat', style: style);
      break;
    case 6:
      text = const Text('Sun', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return text;
}