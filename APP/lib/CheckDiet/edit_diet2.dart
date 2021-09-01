import 'dart:io';
import 'package:ai_project/MemberInfo/management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ai_project/sub_main.dart';
import 'package:ai_project/CheckDiet/check_diet.dart';
import 'package:ai_project/CheckDiet/image_load_button.dart';
import 'package:ai_project/CheckDiet/add_diet.dart';
import 'package:ai_project/SearchDiet/search_bar.dart';
import 'package:ai_project/CheckDiet/inboon_button.dart';

class EditDiet2 extends StatefulWidget {
  const EditDiet2({ Key? key }) : super(key: key);

  @override
  _EditDiet2State createState() => _EditDiet2State();
}

class _EditDiet2State extends State<EditDiet2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식단관리앱'),
        backgroundColor: Color(0xFF151026),
        centerTitle: true,
        elevation: 0.0, // 그림자생김
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('button is clicked');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Management()));
            },
            icon: Icon(Icons.person, size: 30),
            padding: EdgeInsets.only(right: 15, left: 15),
            // 왼쪽도 패딩을 같이 줘야 터치반응액션이 아이콘 중앙에 있게됨
          ),
        ], // 1개 이상의 위젯 리스트를 가짐
      ),
       body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(          
                child: Container(                  //앨범에서 가져온 사진 띄워지는 곳
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.5),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    margin: EdgeInsets.only(top: 20),
                    // color: Colors.amber,
                    width: 200,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      
                      child:  Image.file(
                        
                              WriteDietState.image4checkdiet,                ///////////////////// 널 체크 문제 발생!!!!!!!!!
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
              ),
              SizedBox(
              height: 50.0,
            ),


              Expanded(
                child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
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
              width: 40.0,
            ),
            Flexible(
                        child: NormalMenuButton2()
                      ),
                  SizedBox(
              width: 20.0,
            ),
            
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        
                      ],
                    ),
                  ),
                  

                    ],
                    
                  ),
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
                    '불고기fgagfadgadfgadg'
                  ),
                      ),
                  SizedBox(
              width: 40.0,
            ),
            Flexible(
                        child: NormalMenuButton2()
                      ),
                  SizedBox(
              width: 20.0,
            ),
            
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        
                      ],
                    ),
                  ),
                  

                    ],
                    
                  ),
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
                    '불고기fgagfadgadfgadg'
                  ),
                      ),
                  SizedBox(
              width: 40.0,
            ),
            Flexible(
                        child: NormalMenuButton2()
                      ),
                  SizedBox(
              width: 20.0,
            ),
            
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        
                      ],
                    ),
                  ),
                  

                    ],
                    
                  ),
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
                    '불고기fgagfadgadfgadg'
                  ),
                      ),
                  SizedBox(
              width: 40.0,
            ),
            Flexible(
                        child: NormalMenuButton2()
                      ),
                  SizedBox(
              width: 20.0,
            ),
            
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        
                      ],
                    ),
                  ),
                  

                    ],
                    
                  ),
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
                    '불고기fgagfadgadfgadg'
                  ),
                      ),
                  SizedBox(
              width: 40.0,
            ),
            Flexible(
                        child: NormalMenuButton2()
                      ),
                  SizedBox(
              width: 20.0,
            ),
            
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '칼로리: 1000kcal'
                        ),
                        
                      ],
                    ),
                  ),
                  

                    ],
                    
                  ),
                ),
            ],
    //      ),
        ),
              ),
           ),
           SizedBox(
              height: 10.0,
            ),

           Container(
            
              
                       child: Row( 
                         children: [ //스크롤 할 수 있는 공간 밑에 완료랑 추가 버튼 있도록
                         SizedBox(
              width: 90.0,
            ),
                            Container(
                              // margin: EdgeInsets.only(right: 18, left: 18, top: 5),
                              // // color: Colors.green
                              // width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                color: Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  // side: BorderSide(color: Color(0xFF151026), width: 5),
                                ),
                                onPressed: () {   //등록 버튼 눌렀을 때
                                  print('완료버튼 pressed');
                                  //pickImage2(ImageSource.gallery);
                                  //print('식단조회 페이지에 등록되는 이미지');
                                  //print(new_image);
                                  //image4checkdiet= ImageLoadButtonState.image!;
                                  //print(image4checkdiet);
                                  change2SubMain();

                              },                
                              child: const Text(
                                '완료',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'NanumSquareRound',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ),
                            SizedBox(
                              width: 50.0,
                            ),

                            Container(
                              // margin: EdgeInsets.only(right: 18, left: 18, top: 5),
                              // // color: Colors.green
                              // width: MediaQuery.of(context).size.width,
                              child: FlatButton(
                                color: Colors.grey[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  // side: BorderSide(color: Color(0xFF151026), width: 5),
                                ),
                                onPressed: () {   //등록 버튼 눌렀을 때
                                  print('추가버튼 pressed');
                                  //pickImage2(ImageSource.gallery);
                                  //print('식단조회 페이지에 등록되는 이미지');
                                  //print(new_image);
                                  //image4checkdiet= ImageLoadButtonState.image!;
                                  //print(image4checkdiet);
                                  change2SearchDiet();

                              },                
                              child: const Text(
                                '추가',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'NanumSquareRound',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            ),
                         ],
                       ),
                     //),
           ),
           SizedBox(
              height: 10.0,
            ),
           
            ],
       ),
    
    );
  }

  change2SubMain() {
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(
          builder: (BuildContext context) => SubMain()    
      
      ), (route) => false);
  }

  change2SearchDiet() {
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(
          builder: (BuildContext context) => ExamplePage()    
      
      ), (route) => false);
  }

  


}