import 'dart:io';
import 'dart:ui'; //获取屏幕尺寸需要导入的包

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_flutter/widgets/common/buttons.dart';

class WelcomeGuidePageWidget extends StatefulWidget {
  @override
  State<WelcomeGuidePageWidget> createState() {
// 沉浸式状态栏1:设置状态栏颜色。
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    }
    return new _WelcomeGuidePageState();
  }
}

class _WelcomeGuidePageState extends State<WelcomeGuidePageWidget> {
//  PageController pageController = new PageController();
  int pageViewIndex = 0;

  var images = ["img/test.jpg", "img/test.jpg", "img/test.jpg"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _pageView(),
        new Positioned(
          child: Offstage(
              offstage: pageViewIndex == images.length - 1,
              child: CommonButton.circularWhite12(text: "跳过")),
          top: 36,
          right: 15,
        ),
        new Positioned(
          child: Offstage(
              offstage: pageViewIndex != images.length - 1,
              child: CommonButton.circularWhite12(text: "点击进入")),
          bottom: 20,
        )
      ],
    ));
  }

  Widget _pageView() {
    return new PageView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return new ConstrainedBox(
          child: new Image(
            image: new AssetImage(images[index]),
            fit: BoxFit.fill,
          ),
          constraints: new BoxConstraints.expand(),
        );
      },
      onPageChanged: (index) {
        setState(() {
          pageViewIndex = index;
        });
      },
      scrollDirection: Axis.horizontal,
      reverse: false,
//      controller: pageController,
      physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
    );
  }
}
