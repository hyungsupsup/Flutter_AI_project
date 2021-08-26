import 'dart:io';

import 'package:ai_project/CheckDiet/add_diet.dart';
import 'package:ai_project/MemberInfo/management.dart';
import 'package:ai_project/StatsDiet/calendar_page.dart';
import 'package:ai_project/sub_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:ai_project/CheckDiet/menu_button_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';



class DietGraph extends StatefulWidget {
  const DietGraph({ Key? key }) : super(key: key);

  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<DietGraph> {

  var startDate = CalendarPageState.startDate;
  var endDate = CalendarPageState.endDate;


  //칼로리 그래프(칼로리만 표시)
  static List<charts.Series<MyNutrition, String>> seriesList = [];
  late List<MyNutrition> CalData = [];
  List<charts.Series<MyNutrition, String>> _createRandomData() {
   final random = Random();

   if (CalData.length != 0){    //리스트에 데이터가 이미 들어있다면 초기화시키고 새 데이터 추가
    //CalendarPageState.strTypeDaysList.clear();
    for (int i=0; i<=CalendarPageState.strTypeDaysList.length-1; i++){
      CalData.add(MyNutrition(CalendarPageState.strTypeDaysList[i], random.nextInt(1000)));
     }
   } else if(CalData.length == 0){
     for (int i=0; i<=CalendarPageState.strTypeDaysList.length-1; i++){
      CalData.add(MyNutrition(CalendarPageState.strTypeDaysList[i], random.nextInt(1000)));
     }
   }
   

   
   
   return [
     charts.Series<MyNutrition, String>(
       id: 'Calories [kcal]',
       domainFn: (MyNutrition nut, _) => nut.date,    //x축
       measureFn: (MyNutrition nut, _) => nut.nutrition,    //y축
       data: CalData,   
     ),

   ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [new charts.SeriesLegend()],
      
    );
}

  
  
  //탄단지 그래프(탄단지 정보 표시)
  static List<charts.Series<MyNutrition, String>> seriesList2 = [];
  late List<MyNutrition> TanData = [];
  late List<MyNutrition> DanData = [];
  late List<MyNutrition> JiData = [];

  List<charts.Series<MyNutrition, String>> _createRandomData2() {
   final random = Random();

   for (int i=0; i<=CalendarPageState.strTypeDaysList.length-1; i++){
    TanData.add(MyNutrition(CalendarPageState.strTypeDaysList[i], random.nextInt(1000)));
    }

   for (int i=0; i<=CalendarPageState.strTypeDaysList.length-1; i++){
    DanData.add(MyNutrition(CalendarPageState.strTypeDaysList[i], random.nextInt(1000)));
    }

   for (int i=0; i<=CalendarPageState.strTypeDaysList.length-1; i++){
    JiData.add(MyNutrition(CalendarPageState.strTypeDaysList[i], random.nextInt(1000)));
    }


   return [
     charts.Series<MyNutrition, String>(
       id: 'Tan [g]',
       domainFn: (MyNutrition nut, _) => nut.date,
       measureFn: (MyNutrition nut, _) => nut.nutrition,
       data: TanData,
      //  fillColorFn: (MyNutrition nut, _) {
      //    return MaterialPalette.red.shadeDefault;
      //  },
     ),

      charts.Series<MyNutrition, String>(
       id: 'Dan [g]',
       domainFn: (MyNutrition nut, _) => nut.date,
       measureFn: (MyNutrition nut, _) => nut.nutrition,
       data: DanData,
      //  fillColorFn: (MyNutrition nut, _) {
      //    return MaterialPalette.blue.shadeDefault;
      //  },
     ),

      charts.Series<MyNutrition, String>(
       id: 'Ji [g]',
       domainFn: (MyNutrition nut, _) => nut.date,
       measureFn: (MyNutrition nut, _) => nut.nutrition,
       data: JiData,
      //  fillColorFn: (MyNutrition nut, _) {
      //    return MaterialPalette.green.shadeDefault;
      //  },
     )
   ];
  }





  barChart2() {
  return charts.BarChart(
    seriesList2,
    animate: true,
    vertical: true,
    barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [new charts.SeriesLegend()],
  );
}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createRandomData();
    seriesList2 = _createRandomData2();

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식단통계'),
        backgroundColor: Color(0xFF151026),
        centerTitle: true,
        elevation: 0.0, // 그림자생김
      ),
      
      body: ListView(
        children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                     height: 20.0,
                  ),

                  ElevatedButton(
                    style: ButtonStyle( 
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                    child: Text('날짜 선택',
                            style: TextStyle(color: Colors.black)),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarPage()));
                      
                        }
                  ),
                  SizedBox(
                     height: 30.0,
                     
                  ),

                  Container(
                      width: 400.0,
                      height: 200.0,
                      child: barChart(),
                  ),

                  SizedBox(
                     height: 20.0,
                  ),

                  Container(
                    height: 200.0,
                    width: 400.0,
                    child: barChart2()
                  ),
                ],
              ),
        ],
      ),
      
    );
  }
}


class MyNutrition{
  final String date;
  final int nutrition;

  MyNutrition(this.date, this.nutrition);
}