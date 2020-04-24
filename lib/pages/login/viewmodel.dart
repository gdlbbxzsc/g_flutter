import 'package:flutter/material.dart';
import 'package:g_flutter/base/base_mvvm.dart';

import 'model.dart';

class LoginViewModel extends BaseViewModel {
  final _model = LoginModel();
  int state = 0; // 0 未请求，1 正在请求， 2 请求成功， 3请求失败
  String str = "sssssssssss";
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  login() {
    final data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    /// 不为 0 说明上一条请求未完成，直接退出
    if (state != 0) return;

    /// 开始请求，state 赋值为 1， 并通知监听者
    /// 如果用rxDart插件，可作为doOnListen参数的函数体
    state = 1;
    notifyListeners();

    _model.login(data).listen((v) {
      if (v != 0) {
        /// 返回值不为0，请求失败
        state = 3;
        notifyListeners();
        Future.delayed(Duration(seconds: 1), () {
          state = 0;
          notifyListeners();
        });
      } else {
        str = "人狠话不多";

        /// 返回值为0，请求成功
        state = 2;
        notifyListeners();
        Future.delayed(Duration(seconds: 1), () {
          state = 0;
          notifyListeners();
        });
      }
    });
  }

  @override
  void init() {
    print("init --------- ");
    Future<String>.delayed(Duration(seconds: 5), () {
      print("init Future--------- ");
      return "社会我凡哥";
    }).then((s) {
      print("init Future then--------- ");
      str = s;
      notifyListeners();
    });
  }
}
