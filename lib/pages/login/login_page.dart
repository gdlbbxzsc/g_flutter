import 'package:flutter/material.dart';
import 'package:g_flutter/base/mvvm/view.dart';
import 'package:g_flutter/pages/login/viewmodel.dart';
import 'package:g_flutter/widgets/common/texts.dart';
import 'package:g_flutter/widgets/provider/custom_provider.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPageWidget extends MultiProviderWidget {
  @override
  List<SingleChildWidget> createProviders(BuildContext context) {
    return [
      ChangeNotifierProvider<LoginViewModel>(create: (context) {
        return LoginViewModel(333, context: context);
      }),
      MyChangeNotifierProxyProvider<LoginViewModel, FatherContentModel>(
          update: (context, value, previous) {
        return value.fcm;
      }),
      MyChangeNotifierProxyProvider<FatherContentModel, SonContentModel>(
          update: (context, value, previous) {
        return value.son;
      }),
    ];
  }

  @override
  Widget buildView(BuildContext context) {
    var vm = getViewModel<LoginViewModel>(context);
    return Scaffold(
        body: Column(
      children: <Widget>[
        TextField(controller: vm.usernameController),
        TextField(controller: vm.passwordController),
        RaisedButton(
          onPressed: () {
            vm.login();
          },
          child: Selector<LoginViewModel, String>(
            selector: (_, T) {
              return T.btnText;
            },
            builder: (BuildContext context, value, Widget child) {
              return Text(value);
            },
          ),
        ),
        Selector<FatherContentModel, String>(
          selector: (_, T) {
            if (T == null) return "ffffffffff";
            return T.faStr;
          },
          builder: (BuildContext context, value, Widget child) {
            return CommonText.black13(value);
          },
        ),
        Selector<SonContentModel, String>(
          selector: (_, T) {
            if (T == null) return "sssssssssss";
            return T.sonStr;
          },
          builder: (BuildContext context, value, Widget child) {
            return CommonText.black13(value);
          },
        ),
      ],
    ));
  }
}
