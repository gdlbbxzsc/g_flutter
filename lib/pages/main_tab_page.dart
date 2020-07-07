import 'package:flutter/material.dart';
import 'package:g_flutter/pages/list/list_page.dart';
import 'package:g_flutter/pages/login/login_page.dart';
import 'package:g_flutter/pages/test_page.dart';
import 'package:g_flutter/pages/welcome_guide_page.dart';

class MainTabPageWidget extends StatefulWidget {
  @override
  State<MainTabPageWidget> createState() {
    return MainTabPageState();
  }
}

class MainTabPageState extends State<MainTabPageWidget> {
  List<Map<String, dynamic>> tabs = [
    {
      "title": "首页",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": true
    },
    {
      "title": "首页",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": true
    },
    {
      "title": "首页",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": false
    },
    {
      "title": "首页",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": true
    },
    {
      "title": "首页",
      "selected": "assets/images/player_tab_icon_5_selected.png",
      "unselected": "assets/images/player_tab_icon_5_default.png",
      "visible": true
    }
  ];

//  List<String> _content = ['首页', '任务', '开始赚', '邀请', '我的'];
//
//  List<String> _images = [
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png"
//  ];
//
//  List<String> _images1 = [
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png",
//    "player_tab_icon_5_selected.png"
//  ];

  final List<Widget> _pages = [
    TestPageWidget(),
    Text("a"),
    Text("b"),
    Text("c"),
    Text("d")
  ];

  PageController _controller;
  int _currentIndex = 0;

  initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("标题"),
        ),
        body: _buildBodyWidget(),
        bottomNavigationBar: _buildBottomNavigationBarWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Image.asset(
            tabs[2]["unselected"],
            width: 80,
            height: 80,
          ),
          onPressed: () {
            setState(() {
              this._currentIndex = 2;
            });
          },
        ));
  }

  Widget _buildBodyWidget() {
    return PageView.builder(
      controller: _controller,
      itemCount: _pages.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _pages[index];
      },
      onPageChanged: (index) {
        if (index != _currentIndex) {
          setState(() {
            _currentIndex = index;
          });
        }
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
    return [
      _bottomNavigationBarItem(0),
      _bottomNavigationBarItem(1),
      _bottomNavigationBarItem(2),
      _bottomNavigationBarItem(3),
      _bottomNavigationBarItem(4),
    ];
  }

  BottomNavigationBarItem _bottomNavigationBarItem(int index) {
    return BottomNavigationBarItem(
        title: Text(tabs[index]["title"]),
        icon: _getItemImage(index),
        activeIcon: _getItemImage(index, selected: true));
  }

  Image _getItemImage(int index, {bool selected = false}) {
    return Image.asset(
      selected ? tabs[index]["selected"] : tabs[index]["unselected"],
      width: tabs[index]["visible"] ? 25 : 0,
      height: 25,
    );
  }
}
