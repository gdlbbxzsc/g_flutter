import 'package:flutter/material.dart';
import 'package:g_flutter/pages/test_page.dart';
import 'package:g_flutter/widgets/common/app_bars.dart';

class MainTabPageWidget extends StatefulWidget {
  @override
  State<MainTabPageWidget> createState() {
    return _MainTabPageState();
  }
}

class _MainTabPageState extends State<MainTabPageWidget> {
  List<Map<String, dynamic>> tabs = [
    {
      "title": "首页",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": true,
      "page": TestPageWidget()
    },
    {
      "title": "中间",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": false,
      "page": Text("中间")
    },
    {
      "title": "我的",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": true,
      "page": Text("我的")
    }
  ];

  PageController _controller;
  int _currentIndex = 0; //默认选中和当前选中
  int _centerIndex; //中间按钮所在位置

  initState() {
    super.initState();
    //tabs.length 要奇数
    _centerIndex = tabs.length ~/ 2;

    _controller = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar.noneBlack("测试 标题"),
        body: _buildBodyWidget(),
        bottomNavigationBar: _buildBottomNavigationBarWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            tabs[_centerIndex]["unselected"],
            width: 80,
            height: 80,
          ),
          onPressed: () {
            _controller.jumpToPage(_centerIndex);
//            setState(() {
//              this._currentIndex = centerIndex;
//            });
          },
        ));
  }

  Widget _buildBodyWidget() {
    return PageView.builder(
      controller: _controller,
      itemCount: tabs.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return tabs[index]["page"];
      },
      onPageChanged: (index) {
//        if (index != _currentIndex) {
//          setState(() {
//            _currentIndex = index;
//          });
//        }
      },
    );
  }

  Widget _buildBottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      selectedItemColor: Colors.black45,
      unselectedItemColor: Colors.black45,
      selectedFontSize: 12.0,
      unselectedFontSize: 12.0,
      items: _bottomNavigationBarItems(),
      onTap: (index) {
        _controller.jumpToPage(index);
      },
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems() {
    List<BottomNavigationBarItem> list = new List<BottomNavigationBarItem>();
    for (int i = 0, c = tabs.length; i < c; i++) {
      list.add(_bottomNavigationBarItem(i));
    }
    return list;
  }

  BottomNavigationBarItem _bottomNavigationBarItem(int index) {
    return BottomNavigationBarItem(
      title: Text(tabs[index]["title"]),
      icon: _getItemImage(index, false),
      activeIcon: _getItemImage(index, true),
    );
  }

  final double wh = 25;

  Image _getItemImage(int index, bool selected) {
    return Image.asset(
      selected ? tabs[index]["selected"] : tabs[index]["unselected"],
      width: tabs[index]["visible"] ? wh : 0,
      height: wh,
    );
  }
}
