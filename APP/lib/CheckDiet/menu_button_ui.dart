import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';

// 조회페이지에서 선택할 식사 시간 메뉴 버튼 UI
class NormalMenuButton extends StatefulWidget {
  const NormalMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  _NormalMenuButtonState createState() => _NormalMenuButtonState();
}

class _NormalMenuButtonState extends State<NormalMenuButton> {
  late BoxDecoration decoration;

  late String selectedKey;

  List<String> keys = <String>['아침', '점심', '저녁', '전체'];

  @override
  void initState() {
    selectedKey = '시간 선택';    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget normalChildButton = Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 11),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Text(
                selectedKey,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 12,
              height: 17,
              child: const FittedBox(
                fit: BoxFit.fill,
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        MenuButton<String>(
          child: normalChildButton,
          items: keys,
          topDivider: true,
          itemBuilder: (String value) => Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16),
            child: Text(value),
          ),
          toggledChild: Container(
            child: normalChildButton,
          ),
          divider: Container(
            height: 1,
            color: Colors.grey,
          ),
          onItemSelected: (String value) {
            setState(() {
              selectedKey = value;
            });
          },
          onMenuButtonToggle: (bool isToggle) {
            print(isToggle);
          },
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          menuButtonBackgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
