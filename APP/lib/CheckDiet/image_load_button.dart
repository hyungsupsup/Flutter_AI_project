import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'add_diet.dart';

class ImageLoadButton extends StatefulWidget {   //카메라 기능이 있는 파일
  const ImageLoadButton({Key? key}) : super(key: key);

  @override
  _ImageLoadButtonState createState() => _ImageLoadButtonState();
}

class _ImageLoadButtonState extends State<ImageLoadButton> {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false; // true로 하면 타원모양됨
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.Up;
  var selectedfABLocation = FloatingActionButtonLocation.endFloat;
  File? image;

  Future pickImage(ImageSource imageSource) async {
    try {
      PickedFile? f = await ImagePicker.platform.pickImage(source: imageSource);
      File img_file = File(f!.path);
      print(img_file);
      setState(() => image = img_file);
    } on PlatformException catch (e) {
      print('Failed to picl image: $e');
    }
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    if (image != null) {
      change_write_page();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: SpeedDial(
        icon: Icons.add_rounded,
        activeIcon: Icons.close_rounded,
        backgroundColor: Colors.blue[900],
        spacing: 2,
        openCloseDial: isDialOpen,
        childPadding: EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        buttonSize: 56,
        iconTheme: IconThemeData(size: 33),

        label: extend ? Text("Open") : null,
        activeLabel: extend ? Text("Close") : null,

        childrenButtonSize: 56.0,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,

        closeManually: closeManually,

        renderOverlay: renderOverlay,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        useRotationAnimation: useRAnimation,
        elevation: 8.0,
        isOpenOnStart: false,
        animationSpeed: 200, // + 아이콘 돌아가는 속도
        // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        children: [
          SpeedDialChild(
            child: !rmicons ? Icon(Icons.add_a_photo_rounded) : null,
            backgroundColor: Colors.indigo, // 버튼 배경 색
            foregroundColor: Colors.white, // 아이콘 색
            label: '카메라로 추가하기',
            onTap: () => {print("카메라"), pickImage(ImageSource.camera)},
          ),
          SpeedDialChild(
            child: !rmicons ? Icon(Icons.collections_rounded) : null,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: '앨범에서 불러오기',
            onTap: () => {print("앨범"), pickImage(ImageSource.gallery)},
          ),
        ],
      ),
    );
  }

  change_write_page() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WriteDiet(    //이미지가 선택됐을때 이동
                food_image: image!,
              )),
    );
  }
}
