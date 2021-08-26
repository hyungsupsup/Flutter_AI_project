import 'package:ai_project/Login/kakao_login.dart';
import 'package:ai_project/MemberInfo/input_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk/all.dart';

// 회원 정보 페이지 UI와 기능
class Management extends StatefulWidget {
  const Management({Key? key}) : super(key: key);

  @override
  _ManagementState createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
  static final storage = FlutterSecureStorage();

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
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.person, size: 30),
            padding: EdgeInsets.only(right: 15, left: 15),
            // 왼쪽도 패딩을 같이 줘야 터치반응액션이 아이콘 중앙에 있게됨
          ),
        ], // 1개 이상의 위젯 리스트를 가짐
      ),
      body: Container(
        // color: Colors.red,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8, left: 8),
              width: MediaQuery.of(context).size.width,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InputInfo(
                          additional_text: '신체 정보를 수정해주세요!',
                          pressed_save_button: 1)));
                },
                child: Text(
                  '회원 정보 수정',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'NanumSquare',
                      fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 1.5, color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // <-- Radius
                  ),
                ),
              ),
            ),
            Container(
                child: RaisedButton(
              child: Text("Logout"),
              onPressed: () {
                logOutTalk();    //로그아웃
                unlinkTalk();    //회원탈퇴
                storage.delete(key: "login");    //login이라는 키 값을 없애줌 얘도 회원탈퇴 버튼에 넣어야함

                Navigator.of(context).pop();
              },
            ))
          ],
        ),
      ),
    );
  }

  logOutTalk() async {
    print('호출됨!');
    try {
      var code = await UserApi.instance.logout();
      print('logOutTalk code=${code.toString()}');
    } catch (e) {
      print('logOutTalk error=${e.toString()}');
    }
  }

  unlinkTalk() async {
    try {
      var code = await UserApi.instance.unlink();
      print('unlinkTalk code=${code.toString()}');
    } catch (e) {
      print('unlinkTalk error=${e.toString()}');
    }
  }
}
