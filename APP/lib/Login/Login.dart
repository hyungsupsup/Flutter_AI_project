import 'package:flutter/material.dart';
import 'kakao_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ai_project/main.dart';

class Login extends StatelessWidget {
  static final storage = FlutterSecureStorage();
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    KakaoLogin log = KakaoLogin();
    KakaoLogin l = KakaoLogin();

    return Scaffold(
      appBar: AppBar(
        title: Text("page"),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text("Logout"),
            onPressed: () {
              storage.delete(key: "login");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KakaoLogin()),
              );
              // log.logOutTalk();
            },
          )
        ],
      ),
    );
  }
}
