import 'package:ai_project/CheckDiet/add_diet.dart';
import 'package:ai_project/CheckDiet/edit_diet2.dart';
import 'package:ai_project/CheckDiet/image_load_button.dart';
import 'package:ai_project/MemberInfo/management.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'menu_button_ui.dart';

// 조회 페이지 UI
class CheckDiet extends StatefulWidget {
  const CheckDiet({Key? key}) : super(key: key);
  @override
  CheckDietState createState() => CheckDietState();
}

class CheckDietState extends State<CheckDiet>
    with AutomaticKeepAliveClientMixin {   //다른 페이지 갔다 와도 정보가 그대로 저장돼있음
  String _date = "날짜 선택";
  CupertinoTabBar? tabBar;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('식단관리앱'),
        backgroundColor: Color(0xFF151026),
        centerTitle: true,
        elevation: 0.0, // 그림자생김
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('shopping_cart button is clicked');
              Navigator.push(context,   //회원버튼 눌렀을때 회원정보 페이지 이동
                  MaterialPageRoute(builder: (context) => Management()));
            },
            icon: Icon(Icons.person, size: 30),
            padding: EdgeInsets.only(right: 15, left: 15),
            // 왼쪽도 패딩을 같이 줘야 터치반응액션이 아이콘 중앙에 있게됨
          ),
        ], // 1개 이상의 위젯 리스트를 가짐
      ),
      floatingActionButton: ImageLoadButton(),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 6),
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 8),
                        height: 42,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            datePicker(context);
                          },
                          icon: const Icon(
                            Icons.date_range,
                            color: Colors.black,
                            size: 25,
                          ),
                          label: Text(    //날짜선택 버튼
                            _date,
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                                width: 1.5, color: Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        margin: const EdgeInsets.only(left: 8, right: 8),
                        child: NormalMenuButton(),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 42,
                      width: 70,
                      child: RaisedButton(
                        child: const Text(
                          '조회',
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'NanumSquareRound',
                              fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.red[100],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              height: 1.5,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.grey[350],
            ),                          //회색 구분 선

            Expanded(                                  
                child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                    children: [
                      
                      Container(                  //앨범에서 가져온 사진 띄워지는 곳, 사진 누르면 식단 수정 페이지로 이동하게 해보자@@@@@@
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            //borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          // color: Colors.amber,
                          width: 350,
                          height: 510,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                   '   디폴트날짜       아침      칼로리: 1000kcal'
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print("delete diet");                       
                                    },
                                  icon: Icon(Icons.remove_circle, color: Colors.red),
                                  iconSize: 20.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    change2EditDiet2();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    
                                    child:  Image.file(
                                      
                                            WriteDietState.image4checkdiet,                ///////////////////// 널 체크 문제 발생!!!!!!!!!
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                    
                  
                
                      Container(                  //앨범에서 가져온 사진 띄워지는 곳, 사진 누르면 식단 수정 페이지로 이동하게 해보자@@@@@@
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            //borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          // color: Colors.amber,
                          width: 350,
                          height: 510,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                   '   디폴트날짜       점심      칼로리: 1000kcal'
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print("delete diet");                       
                                    },
                                  icon: Icon(Icons.remove_circle, color: Colors.red),
                                  iconSize: 20.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    change2EditDiet2();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    
                                    child:  Image.file(
                                      
                                            WriteDietState.image4checkdiet,                ///////////////////// 널 체크 문제 발생!!!!!!!!!
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),

                      Container(                  //앨범에서 가져온 사진 띄워지는 곳, 사진 누르면 식단 수정 페이지로 이동하게 해보자@@@@@@
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            //borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          // color: Colors.amber,
                          width: 350,
                          height: 510,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                   '   디폴트날짜       저녁      칼로리: 1000kcal'
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print("delete diet");                       
                                    },
                                  icon: Icon(Icons.remove_circle, color: Colors.red),
                                  iconSize: 20.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    change2EditDiet2();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    
                                    child:  Image.file(
                                      
                                            WriteDietState.image4checkdiet,                ///////////////////// 널 체크 문제 발생!!!!!!!!!
                                            fit: BoxFit.fill,
                                          ),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),

                        Container(                  //앨범에서 가져온 사진 띄워지는 곳, 사진 누르면 식단 수정 페이지로 이동하게 해보자@@@@@@
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            //borderRadius: const BorderRadius.all(Radius.circular(15)),
                          ),
                          margin: EdgeInsets.only(top: 20),
                          // color: Colors.amber,
                          width: 350,
                          height: 510,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                   '   디폴트날짜       기타      칼로리: 1000kcal'
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      print("delete diet");                       
                                    },
                                  icon: Icon(Icons.remove_circle, color: Colors.red),
                                  iconSize: 20.0,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: (){
                                    change2EditDiet2();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    
                                    child:  Image.file(
                                      
                                            WriteDietState.image4checkdiet,                ///////////////////// 널 체크 문제 발생!!!!!!!!!
                                            fit: BoxFit.fill,
                                          ),
                                  ),
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

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: Container(                  //앨범에서 가져온 사진 띄워지는 곳, 사진 누르면 식단 수정 페이지로 이동하게 해보자@@@@@@
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.grey, width: 1.5),
            //           borderRadius: const BorderRadius.all(Radius.circular(15)),
            //         ),
            //         margin: EdgeInsets.only(top: 20),
            //         // color: Colors.amber,
            //         width: 200,
            //         height: 200,
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(15),
                      
            //           child:  Image.file(
                        
            //                   WriteDietState.image4checkdiet,                ///////////////////// 널 체크 문제 발생!!!!!!!!!
            //                   fit: BoxFit.fill,
            //                 ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  datePicker(context) {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2030), onConfirm: (date) {
      print('confirm $date');
      _date = '${date.year}/${date.month}/${date.day}';
      setState(() {
        Text(_date);
      });
    }, currentTime: DateTime.now(), locale: LocaleType.ko);
    return _date;
  }

  change2EditDiet2() {
    Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(
          builder: (BuildContext context) => EditDiet2()    
      
      ), (route) => false);
  }

}
