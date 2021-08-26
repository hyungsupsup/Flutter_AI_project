import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/user.dart';
import 'package:ai_project/MemberInfo/input_info.dart';

class KakaoLogin extends StatefulWidget {    //로그인 기능 & ui
  const KakaoLogin({Key? key}) : super(key: key);

  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  static const storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _initKakaoTalkInstalled();
  }

  // 카카오톡 설치 여부 확인
  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    print('kakao installed = $installed');
    setState(() {
      _isKakaoTalkInstalled = installed;
    });
  }

  bool _isKakaoTalkInstalled = true;

  _loginWithKakao() async {    //카톡 설치돼있는지 확인후 로그인 화면ㄱ, 카톡이 없으면 웹페이지에서 로그인할 수 있게 함
    try {
      var code = await AuthCodeClient.instance.request();
      await _issueAccessToken(code);
      print('code:$code');
    } catch (e) {
      print(e);
    }
  }

  // 카카오 어플로 설치      
  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
      print('code:$code');
    } catch (e) {
      print(e);
    }
  }
  late String id;
  _getUserId() async {
    User user = await UserApi.instance.me();
    setState(() {
      id = user.kakaoAccount.profile.toJson()['nickname'];
    });
  }

  _getUserEmail() async {
    User user = await UserApi.instance.me();
    return user.kakaoAccount!.email.toString();
  }

  _getUserInfo() async {
    User user = await UserApi.instance.me();
    print(
        "=========================[kakao account]=================================");
    // print(user.kakaoAccount.toString());
    // userid 나오는 곳
    String id = user.toString();
    print(user.toString());
    print(id[0]);
    print(
        "=========================[kakao account]=================================");
  }

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      print(token.toString());
      await _getUserInfo();
      var userId = await _getUserId();
      // var userEmail = await _getUserEmail();
      await storage.write(key: 'login', value: userId); 

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(        
            builder: (context) => InputInfo(
                  additional_text: '개인 맞춤 서비스를 위해\n신체 정보를 꼭 입력해주세요!',
                  pressed_save_button: 0,
                )),
      );
    } catch (e) {
      print("error on issuing access token: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color(0xFF151026),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('식단관리 어플이 처음이라면?'),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CupertinoButton(
                  onPressed:
                      _isKakaoTalkInstalled ? _loginWithTalk : _loginWithKakao,
                  child: Image.asset(
                    'image/kakao_login_large_wide.png',
                    width: 300,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
