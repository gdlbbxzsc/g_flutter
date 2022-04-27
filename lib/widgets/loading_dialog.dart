import 'package:flutter/material.dart';
import 'package:gsl_flutter_app/constant/Constant.dart';
import 'package:gsl_flutter_app/util/Utils.dart';

class LoadingDialog {
  static bool _isShow = false;
  static OverlayEntry _overlayEntry = null;

  static void show(context) {
    if (_isShow) return;
    _isShow = true;
    if (_overlayEntry != null) return;
    //创建一个OverlayEntry对象
    _overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: new Material(
          //创建透明层
          type: MaterialType.transparency, //透明类型
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0x00000000),
            child: new Center(
              //保证控件居中效果
              child: new SizedBox(
                width: 120.0,
                height: 120.0,
                child: new Container(
                  decoration: ShapeDecoration(
                    color: Color(0xffaaaaaa),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new CircularProgressIndicator(),
                      new Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                        ),
                        child: new Text(
                          '请稍后......',
                          style: new TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(_overlayEntry);
    //两秒后，移除
    new Future.delayed(Duration(seconds: 10)).then((value) {
      _overlayEntry.remove();
      alertDialog(context, '请求超时，请稍后尝试');
    });
  }

  static alertDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
              alignment: Alignment.center,
              child: Text(
                '提示',
              )),
          content: Text(content),
          actions: <Widget>[
            Container(
              width: getScreenSize(context).width,
              alignment: Alignment.center,
              child: Column(children: <Widget>[
                Container(
                    width: getScreenSize(context).width,
                    height: 0.5,
                    color: Colors.grey),
                FlatButton(
                    child: Text('关闭', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ]),
            )
          ],
          backgroundColor: ColorConstant.mainBgColor,
          elevation: 20,
          semanticLabel: '',
          // 设置成 圆角
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      },
    );
  }

  static dismiss() {
    if (!_isShow) return;
    _isShow = false;
    if (_overlayEntry == null) return;
    _overlayEntry.remove();
    _overlayEntry = null;
  }
}
