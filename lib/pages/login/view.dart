import 'package:flutter/material.dart';
import 'package:g_flutter/base/base_mvvm.dart';
import 'package:g_flutter/pages/login/viewmodel.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginWidget extends BaseWidget<LoginViewModel> {
  @override
  LoginViewModel createViewModel() {
    return LoginViewModel();
  }

  @override
  Widget buildView(BuildContext context) {
    print("buildView-------");
    return Scaffold(
        body: Column(
      children: <Widget>[
        TextField(controller: viewModel.usernameController),
        TextField(controller: viewModel.passwordController),
        Selector<LoginViewModel, int>(
          selector: (_, T) => T.state,
          builder: (BuildContext context, value, Widget child) {
            return RaisedButton(
              onPressed: viewModel.login,
              child: value == 0
                  ? Text("${viewModel.str}")
                  : value == 1
                      ? CircularProgressIndicator()
                      : value == 2 ? Icon(Icons.done) : Icon(Icons.cancel),
            );
          },
        ),
      ],
    ));
  }
}
