import 'package:ai_project/Class4Flask/dietListDto.dart';
import 'package:ai_project/Class4Flask/userInfoDto.dart';
import 'package:ai_project/Login/kakao_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../sub_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 첫 시작시 회원 정보 입력 받기
class InputInfo extends StatefulWidget {
  String additional_text;
  int pressed_save_button;
  InputInfo(
      {Key? key,
      required this.additional_text,
      required this.pressed_save_button})
      : super(key: key);

  @override
  _InputInfoState createState() => _InputInfoState();
}

class _InputInfoState extends State<InputInfo> {
  int gender_current_seg = 0;
  int activity_index_current_seg = 0;
  //String userId = '1';
  String meal = '4';
  String created_at = '2021-09-03';
  String gender = '';
  String activity = '';

  String cal = '';
  String img_path = '';

  // 사용가자 입력한 값 가져오기 위한 컨트롤러
  TextEditingController member_height = TextEditingController();
  TextEditingController member_weight = TextEditingController();
  TextEditingController member_age = TextEditingController();

  final Map<int, Widget> gender_segments = const <int, Widget>{
    0: Text('남자'),
    1: Text('여자'),
  };

  final Map<int, Widget> activity_index_segments = const <int, Widget>{
    0: Text('비활동적'),
    1: Text('저활동적'),
    2: Text('활동적'),
    3: Text('매우 활동적')
  };

  void text_print() {
    print('====================textfield 정보====================');
    print('키:' + member_height.value.text.toString());
    print('몸무게:' + member_weight.value.text.toString());
    print('나이:' + member_age.value.text.toString());
    print('성별:' + gender_segments[gender_current_seg].toString());
    print('활동 지수:' +
        activity_index_segments[activity_index_current_seg].toString());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('회원정보입력'), 
          backgroundColor: Color(0xFF151026),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // color: Colors.red,
                        margin: const EdgeInsets.all(50),
                        child: Text(
                          widget.additional_text,
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'NanumSquare',
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: 1.5,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[350],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 40),
                        // alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '키',
                              style: TextStyle(
                                  fontSize: 17, fontFamily: 'NanumSquare'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: member_height,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                  labelText: 'cm'
                                  ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '체중',
                              style: TextStyle(
                                  fontSize: 17, fontFamily: 'NanumSquare'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: member_weight,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                  labelText: 'kg'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '나이',
                              style: TextStyle(
                                  fontSize: 17, fontFamily: 'NanumSquare'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextField(
                              keyboardType: TextInputType.number,
                              controller: member_age,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                  ),
                                  labelText: '세'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '성별',
                              style: TextStyle(
                                  fontSize: 17, fontFamily: 'NanumSquare'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Expanded(
                                child: CupertinoSlidingSegmentedControl<int>(
                                    padding: EdgeInsets.all(0),
                                    groupValue: gender_current_seg,
                                    children: gender_segments,
                                    onValueChanged: (i) {
                                      setState(() {
                                        gender_current_seg = i!;
                                      });
                                    }),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              '활동지수',
                              style: TextStyle(
                                  fontSize: 17, fontFamily: 'NanumSquare'),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Expanded(
                                child: CupertinoSlidingSegmentedControl<int>(
                                    padding: EdgeInsets.all(0),
                                    groupValue: activity_index_current_seg,
                                    children: activity_index_segments,
                                    onValueChanged: (i) {
                                      setState(() {
                                        activity_index_current_seg = i!;
                                      });
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  // width: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: FlatButton(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      // side: BorderSide(color: Color(0xFF151026), width: 5),
                    ),
                    onPressed: () {                  ////////////// #2으로  users PUT 먼저 하고, if 200일떄 메인화면으로 이동하면서, #7을 호출한다
                    if(gender_segments[gender_current_seg].toString()=='Text("남자")'){
                      gender = '2';
                    }else if(gender_segments[gender_current_seg].toString()=='Text("여자")'){
                      gender = '1';
                    }

                    if(activity_index_segments[activity_index_current_seg].toString()=='Text("비활동적")'){
                      activity = '1';

                    }else if(activity_index_segments[activity_index_current_seg].toString()=='Text("저활동적")'){
                      activity = '2';

                    }
                    else if(activity_index_segments[activity_index_current_seg].toString()=='Text("활동적")'){
                      activity = '3';
                      
                    }
                    else if(activity_index_segments[activity_index_current_seg].toString()=='Text("매우 활동적")'){
                      activity = '4';
                      
                    }
                      sendUserInfo();   //#2
                      
                    },
                    child: Text(
                      '저장',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'NanumSquareRound',
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  sendUserInfo() async{   //#2
   
    UserInfoDto userInfo = new UserInfoDto(KakaoLoginState.user_id, member_age.value.text.toString(), gender, member_height.value.text.toString(), member_weight.value.text.toString(), activity);
    var userInfoJson = userInfo.toJson();
    text_print();
    print(gender);
    print(activity);
    print(userInfoJson);

    final url = 'http://3.38.106.149/users/';
    print(Uri.parse(url));

    print(url);
    //sending a post request to the url

    final response = await http.put(Uri.parse(url), body: json.encode(userInfoJson), headers: {'Content-Type':'application/json'});   
    print('hello1');
    print(response.body);

    if (response.statusCode==200){
      Map userMap=jsonDecode(response.body);
      print(userMap);    //success 떠야함
      sendMainPage();
      //String userId = userMap['user_id'].toString();
      
      //await storage.write(key: 'userid', value:userId);
    } 
  }

 sendMainPage() async{   //#7
  //#7호출
  DietListDto dietList = new DietListDto(KakaoLoginState.user_id, created_at, meal);   //2번째 인자에 created_at에 들어갈 날짜 정보 생성해서 넣어야함, meal은 디폴트 값 4
  var DietListJson = dietList.toJson();
  print(DietListJson);

  final url = 'http://3.38.106.149/diets/list';
  print(Uri.parse(url));

  print(url);
  //sending a post request to the url

  final response = await http.post(Uri.parse(url), body: json.encode(DietListJson), headers: {'Content-Type':'application/json'});   
  print('hello2');
  print(response);
  print(response.body);
  print('hello3');

  ///////////////////////////////////// 여기에 서버에서 온 값들 변수에 저장해놔야함 #7    
  Map userMap=jsonDecode(response.body);    //response를 디코딩해서 변수에 저장
  print(userMap);
  print('hello4');
  //diet_list = userMap['diet_list'].toString();
  cal = userMap['diet_list']['cal'].toString();
  img_path = userMap['diet_list']['img_path'].toString(); 
  print(img_path);


  widget.pressed_save_button == 0
  ? Navigator.of(context).pushReplacement(    //서버에서 준 데이터들을 변수에 다 저장한 후, 메인 화면으로 이동
      MaterialPageRoute(
          builder: (context) => SubMain()))    //메인화면으로 이동
  : Navigator.of(context).pop();




  }

  recieveMainPage() async{    // #7 호출하고 데이터들 받고 변수에 저장
    

  }


}
