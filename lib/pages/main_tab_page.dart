import 'package:flutter/material.dart';
import 'package:g_flutter/pages/test_page.dart';

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
      itemCount: tabs.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return tabs[index]["page"];
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
