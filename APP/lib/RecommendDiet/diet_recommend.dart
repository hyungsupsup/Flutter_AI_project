import 'dart:io';

import 'package:ai_project/CheckDiet/add_diet.dart';
import 'package:ai_project/MemberInfo/management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:ai_project/CheckDiet/menu_button_ui.dart';

class DietRecommend extends StatefulWidget {
  const DietRecommend({ Key? key }) : super(key: key);

  @override
  _DietRecommendState createState() => _DietRecommendState();
}

String getSystemTime(){
  var now = DateTime.now();
  return DateFormat("h:mm a").format(now);
}


class _DietRecommendState extends State<DietRecommend> {
  var date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식단추천'),
        backgroundColor: Color(0xFF151026),
        centerTitle: true,
        elevation: 0.0, // 그림자생김
      ),
  
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(  //최상위 column 박스

          children: [
            Column(           //최상위 column 박스 안에서 가장 위에 있는 column 박스
              children: [
                //날짜 정보와 식사 추천 텍스트
                Row(
                  children: [
                    TimerBuilder.periodic(
                      Duration(days: 1), 
                      builder: (context){
                        print('${getSystemTime()}');
                        return Text(
                          DateFormat('EEEE, ').format(date),
                    
                        );
                      },
                    ),
                    
                    Text(
                      DateFormat('M/d/y').format(date),

                    ),
                    SizedBox(
              width: 120.0,
            ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                   border: Border.all(color: Colors.black)
                   ),
                      child: Text(                       //이전에 등록한 식사에 따라 달라짐
                        '저녁 추천'   
                      ),
                    )
                  ],
                  ),
                
              ],
            ),

            Column(               //섭취량 정보 텍스트,  2번째 위에 있는 column박스
              children: [
                SizedBox(
              height: 30.0,
            ),
                Text(
                  '단백질 섭취량이 목표치보다 40% 부족하네요!'
                ),
                Text(
                  '저녁에는 이런 음식들 어떠세요?'
                  ),
                SizedBox(
              height: 50.0,
            ),

              ],
            ),

            Column(     
              mainAxisAlignment: MainAxisAlignment.center,          //추천 음식 사진 3개 출력,  3번째 위에 있는 row박스
              children: [
                
                Container(
                   margin: const EdgeInsets.all(15.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                   border: Border.all(color: Colors.blueAccent)
                   ),

                  child: Row(               //첫번째 사진과 그 아래 영양 정보 있는 박스
                    children: [
                      Flexible(
                        child: Text(
                    '불고기fgagfadgadfgadg'
                  ),
                      ),
                  SizedBox(
              width: 50.0,
            ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        Text(
                          '탄수화물: 200g'
                        ),
                        Text(
                          '단백질: 150g'
                        ),
                        Text(
                          '지방: 324g'
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
              width: 50.0,
            ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        print("liked");
                      },
                      icon: Icon(Icons.favorite),
                      color: Colors.red,           
                      iconSize: 20.0,

                    ),
                  ),

                    ],
                    
                  ),
                ),
                SizedBox(
              height: 40.0,
            ),

                Container(
                   margin: const EdgeInsets.all(15.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                   border: Border.all(color: Colors.blueAccent)
                   ),

                  child: Row(               //첫번째 사진과 그 아래 영양 정보 있는 박스
                    children: [
                      Flexible(
                        child: Text(
                    '탕수육ㅎㄷㅈㄹㄻㄱㅎㅇ로오논론로'
                  ),
                      ),
                  SizedBox(
              width: 50.0,
            ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        Text(
                          '탄수화물: 200g'
                        ),
                        Text(
                          '단백질: 150g'
                        ),
                        Text(
                          '지방: 324g'
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
              width: 50.0,
            ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        print("liked");
                      },
                      icon: Icon(Icons.favorite),
                      color: Colors.red,           
                      iconSize: 20.0,

                    ),
                  ),

                    ],
                    
                  ),
                ),
                SizedBox(
              height: 40.0,
            ),

                Container(
                   margin: const EdgeInsets.all(15.0),
                   padding: const EdgeInsets.all(3.0),
                   decoration: BoxDecoration(
                   border: Border.all(color: Colors.blueAccent)
                   ),

                  child: Row(               //첫번째 사진과 그 아래 영양 정보 있는 박스
                    children: [
                      Flexible(
                        child: Text(
                    '치킨ㅇㄹㄴㅇㄻㅎㅁㄴㅁㄹㅇㄴ'
                  ),
                      ),
                  SizedBox(
              width: 50.0,
            ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        Text(
                          '탄수화물: 200g'
                        ),
                        Text(
                          '단백질: 150g'
                        ),
                        Text(
                          '지방: 324g'
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
              width: 50.0,
            ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        print("liked");
                      },
                      icon: Icon(Icons.favorite),
                      color: Colors.red,           
                      iconSize: 20.0,

                    ),
                  ),

                    ],
                    
                  ),
                ),
                

              ],
            ),

          ],
        )
      )
      
    );
  }
}