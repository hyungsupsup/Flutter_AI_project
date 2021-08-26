
import 'dart:io';
import 'package:ai_project/CheckDiet/add_diet.dart';
import 'package:ai_project/MemberInfo/management.dart';
import 'package:ai_project/StatsDiet/diet_graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:ai_project/CheckDiet/menu_button_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:ai_project/sub_main2.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({ Key? key }) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  DateRangePickerController _datePickerController = DateRangePickerController();
  static String startDate = DateFormat('M/d').format(DateTime.now()).toString();
  static String endDate = DateFormat('M/d').format(DateTime.now()).toString();
  static String date = DateFormat('M/d').format(DateTime.now()).toString();

  //시작날짜와 끝날짜 사이 날짜들 불러오는 리스트
  List<DateTime> daysList = [];
  List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {   
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      daysList.add(startDate.add(Duration(days: i)));
    }
    return daysList;
  }

  //리스트에 담긴 날짜들을 스트링 타입으로 변환하는 메소드
  static List<String> strTypeDaysList = [];
  List<String> convert2string(List<DateTime> daysList){
    
    for (int i = 0; i<= daysList.length-1; i++){
        strTypeDaysList.add(DateFormat('M/d').format(daysList[i]).toString());

    }
    
    return strTypeDaysList;

  }

  
  //static List<DateTime> days = [];
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      setState(() {
        if (args.value.endDate==null){  //첫번째 날짜 눌렀을때

            if(strTypeDaysList.length == 0){
              startDate=DateFormat('M/d').format(args.value.startDate).toString();
              print(startDate);
              } else if(strTypeDaysList.length != 0){
              strTypeDaysList.clear();
              startDate=DateFormat('M/d').format(args.value.startDate).toString();
              print(startDate);
              }
          
        } else if(args.value.endDate!=null){  //두번째 날짜 눌렀을때
            getDaysInBeteween(args.value.startDate, args.value.endDate);
            endDate=DateFormat('M/d').format(args.value.endDate).toString();
            print(endDate);
            convert2string(daysList);
            print(strTypeDaysList);
        }
        print(daysList);
        
      });


  });

  //      //타입은 DateTime 임
  //  print('시작날짜');
  //  print(args.value.startDate);
  //  print('끝날짜');
  //  print(args.value.endDate);

  //  if (args.value.endDate==null){   //끝날짜가 null일때, 즉, 캘린더에서 날짜 하나 누를때 
  //    print('endDate==null일때');
  //    print(args.value.startDate);     //시작날짜 출력하고
     
  //    days.add(args.value.startDate);   //days 리스트에 시작날짜 추가
  //    return days;
  //  } else if(args.value.endDate!=null){    //끝날짜가 null이 아닐때, 즉, 캘린더에서 두 번째 날짜 누를때
  //    print('endDate가 null이 아닐때');
  //    print(args.value.endDate);    //끝날짜 출력하고
     
  //    days.add(args.value.endDate);    //리스트에 끝날짜 추가
  //  }
  //  return days;     //시작 날짜와 끝날짜가 들어있는 리스트 반환  
   
 }

//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     daysList = _onSelectionChanged();
    
//   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: SfDateRangePicker(
        view: DateRangePickerView.month,
        monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 6),
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: _onSelectionChanged,     //캘린더에서 날짜 누를 시 발생
        showActionButtons: true,
        controller: _datePickerController,
        //onViewChanged: viewChanged,
        onSubmit: (Object value) {     //ok 누르면서 날짜 범위 최종 선택
          print(value);
          
         change2GraphPage();    //ok 버튼 누르면 식단통계 페이지로 복귀
        },
        onCancel: () {
          _datePickerController.selectedRanges = null;
        },
      ),
      ),

      
    );
  }


  change2GraphPage() {
    Navigator.pushReplacement(context,
      MaterialPageRoute(
          builder: (context) => SubMain2()    //이미지가 선택됐을때 이동, submain2 지우고 submain에서 해결해야해
      
      ),
    );
  }

}









  
