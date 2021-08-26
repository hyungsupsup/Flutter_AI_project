import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import 'CheckDiet/check_diet.dart';
import 'StatsDiet/diet_graph.dart';
import 'RecommendDiet/diet_recommend.dart';
import 'MemberInfo/input_info.dart';

// 조회, 추천, 통계 페이지 전환을 위한 UI
class SubMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubMain();
  }
}

class _SubMain extends State<SubMain> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        initialSelectedTab: "식단조회",
        labels: const ["식단조회", "식단추천", "식단통계"],
        icons: const [
          Icons.restaurant_rounded,
          Icons.thumb_up_alt_rounded,
          Icons.add_chart_rounded,
        ],

        tabSize: 50, // 탭바 버튼 눌렀을 때 동그라미 크기
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontFamily: 'NanumSquare',
          fontWeight: FontWeight.w800,
        ),
        tabIconColor: Color(0xFF151026),
        tabIconSize: 28.0,

        tabIconSelectedSize: 26.0,
        tabSelectedColor: Colors.blue[900],
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.grey[300],
        onTabItemSelected: (int value) {
          setState(() {
            _tabController!.index = value;
          });
        },
      ),
      body: TabBarView(
        dragStartBehavior: DragStartBehavior.start,
        physics:
            const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        controller: _tabController,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const CheckDiet(), //식단조회 버튼 누를 시 CheckDiet 함수 실행
          const DietRecommend(),
          const DietGraph(), //식단통계 버튼 누를 시 DietGraph 함수 실행
        ],
      ),
    );
  }
}
