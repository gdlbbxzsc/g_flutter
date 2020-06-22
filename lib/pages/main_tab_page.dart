import 'package:flutter/material.dart';
import 'package:g_flutter/pages/welcome_guide_page.dart';

class MainTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainTabPage> {
  List<String> _content = ['首页', '任务', '开始赚', '邀请', '我的'];

  List<String> _images = [
//    Constant.getImagePath("player_tab_icon_1_default.png"),
//    Constant.getImagePath("player_tab_icon_2_default.png"),
//    Constant.getImagePath("player_tab_icon_3_default.png"),
//    Constant.getImagePath("player_tab_icon_4_default.png"),
//    Constant.getImagePath("player_tab_icon_5_default.png")
  ];

  List<String> _images1 = [
//    Constant.getImagePath("player_tab_icon_1_selected.png"),
//    Constant.getImagePath("player_tab_icon_2_selected.png"),
//    Constant.getImagePath("player_tab_icon_3_default.png"),
//    Constant.getImagePath("player_tab_icon_4_selected.png"),
//    Constant.getImagePath("player_tab_icon_5_selected.png")
  ];

  final List<Widget> _pages = [
    WelcomeGuidePage(),
    WelcomeGuidePage(),
    WelcomeGuidePage(),
    WelcomeGuidePage(),
    WelcomeGuidePage()
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
          child: _getItemImage(2, width: 80, height: 80),
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
      BottomNavigationBarItem(
          title: Text(_content[0]),
          icon: _getItemImage(0),
          activeIcon: _getItemImage(0, selected: true)),
      BottomNavigationBarItem(
          title: Text(_content[1]),
          icon: _getItemImage(1),
          activeIcon: _getItemImage(1, selected: true)),
      BottomNavigationBarItem(
          title: Text(_content[2]),
          icon: _getItemImage(2, width: 0),
          activeIcon: _getItemImage(2, width: 0, selected: true)),
      BottomNavigationBarItem(
          title: Text(_content[3]),
          icon: _getItemImage(3),
          activeIcon: _getItemImage(3, selected: true)),
      BottomNavigationBarItem(
          title: Text(_content[4]),
          icon: _getItemImage(4),
          activeIcon: _getItemImage(4, selected: true))
    ];
  }

  Image _getItemImage(int index,
      {double width = 25, double height = 25, bool selected = false}) {
    return Image.asset(
      selected ? _images1[index] : _images[index],
      width: width,
      height: height,
    );
  }
}
