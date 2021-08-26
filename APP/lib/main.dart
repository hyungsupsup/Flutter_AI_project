import 'dart:async';
import 'package:ai_project/CheckDiet/check_diet.dart';
import 'package:ai_project/camera_test.dart';
import 'package:ai_project/sub_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/link.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:ai_project/Login/Login.dart';
import 'package:ai_project/Login/kakao_login.dart';
import 'MemberInfo/input_info.dart';

void main() {
  KakaoContext.clientId = '29ee70f50723021973ddf4f7aca15436';
  KakaoContext.javascriptClientId = '4adeac62b441cd19acc2fe4b0c71775a';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MainPage(),
      //   '/second': (context) => CheckDiet(),
      // },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return Login();
    return const StartPage();
    // return SubMain();
    // return ctest();
  }
}

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String userInfo = '';
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      loadUserLogin();
    });
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => KakaoLogin()),
      ),
    );
  }

  // 기기에 저장된 로그인 정보 불러오기
  loadUserLogin() async {
    // login key값에 저장된 값 불러오기
    userInfo = (await storage.read(key: 'login'))!;
    print(userInfo);

    // 로그인한 값이 저장됐으면 SubMain 페이지로 이동
    if (userInfo != null) {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SubMain(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Scaffold(
        body: Center(
          child: Text(
            '인공지능\n식단관리앱',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
