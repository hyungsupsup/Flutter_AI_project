import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import '../sub_main.dart';

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
                                  labelText: 'cm'),
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
                    onPressed: () {
                      text_print();
                      widget.pressed_save_button == 0
                          ? Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SubMain()))
                          : Navigator.of(context).pop();
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
}
