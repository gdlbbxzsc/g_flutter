import 'package:flutter/material.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';

import 'model.dart';

class LoginViewModel extends BaseViewModel {
  final _model = LoginModel();

  String btnText = "LoginViewModel Def";
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  FatherContentModel fcm;

  int num = 222;

  LoginViewModel(this.num, {context}) : super(context: context);

  @override
  void initViewModel() {
    Future<String>.delayed(Duration(seconds: 5), () {
      return "社会我凡哥";
    }).then((s) {
      btnText = s;
      notifyListeners();
    });
  }

  @override
  void destroyViewModel() {}

  login() {
    btnText = "人狠话不多";

    fcm = new FatherContentModel();
    fcm.faStr = "斑马 斑马 我是你爸爸";

    notifyListeners();
  }
}

class FatherContentModel extends ContentViewModel {
  String faStr = "FatherContentModel Def";

  SonContentModel son;

  @override
  void initViewModel() {
    super.initViewModel();
    son = new SonContentModel();
    son.sonStr = "你站在那里不要动 我去给你买";
  }
}

class SonContentModel extends ContentViewModel {
  String sonStr = "SonContentModel Def";
}
