import 'dart:io';
import 'package:ai_project/MemberInfo/management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_button/group_button.dart';
import 'package:image_picker/image_picker.dart';

// 식단 추가 작성 페이지 (인공지능에 들어가기 전 페이지)
class WriteDiet extends StatefulWidget {
  final File food_image;          ////////////
  const WriteDiet({Key? key, required this.food_image}) : super(key: key);         //////////////

  @override
  _WriteDietState createState() => _WriteDietState();
}

class _WriteDietState extends State<WriteDiet> {
  List<String> button_value = ["아침", "점심", "저녁"];
  TextEditingController month_value = TextEditingController();
  TextEditingController day_value = TextEditingController();
  File? new_image; // 다시 선택하기 버튼 누를 때 불러올 이미지 변수

  Future pickImage(ImageSource imageSource) async {
    try {
      PickedFile? f = await ImagePicker.platform.pickImage(source: imageSource);
      File img_file = File(f!.path);
      print(img_file);
      setState(() => new_image = img_file);
    } on PlatformException catch (e) {
      print('Failed to picl image: $e');
    }
  }

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.5),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.only(top: 20),
                  // color: Colors.amber,
                  width: 300,
                  height: 300,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: new_image != null
                        ? Image.file(
                            new_image!,
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            widget.food_image,      ///////
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                // color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('다시 선택하기'),
                    OutlinedButton(
                      onPressed: () {
                        pickImage(ImageSource.camera);
                      },
                      child: const Text(
                        '카메라',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NanumSquare',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 1.5, color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // <-- Radius
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                      },
                      child: const Text(
                        '갤러리',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'NanumSquare',
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(width: 1.5, color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // <-- Radius
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 2.5,
                color: Colors.grey[300],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      '날짜',
                      style: TextStyle(fontSize: 15, fontFamily: 'NanumSquare'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 8),
                        child: SizedBox(
                          width: 45,
                          height: 35,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: month_value,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: '월'),
                          ),
                        ),
                      ),
                      const Text(
                        '월',
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'NanumSquare'),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4, left: 8),
                        child: SizedBox(
                          width: 45,
                          height: 35,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: day_value,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: '일'),
                          ),
                        ),
                      ),
                      const Text(
                        '일',
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'NanumSquare'),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "식사 시간",
                      style: TextStyle(fontSize: 15, fontFamily: 'NanumSquare'),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    GroupButton(
                      mainGroupAlignment: MainGroupAlignment.start,
                      crossGroupAlignment: CrossGroupAlignment.start,
                      groupRunAlignment: GroupRunAlignment.start,
                      isRadio: true,
                      spacing: 10,
                      buttons: button_value,
                      onSelected: (index, isSelected) => print(
                          '$index button is selected ' + button_value[index]),
                      selectedTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      selectedColor: Colors.grey[100],
                      unselectedBorderColor: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 18, left: 18, top: 5),
                // color: Colors.green
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side: BorderSide(color: Color(0xFF151026), width: 5),
                  ),
                  onPressed: () {},
                  child: const Text(
                    '등록',
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
        ),
      ),
    );
  }
}
