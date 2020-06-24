import 'package:flutter/material.dart';
import 'package:g_flutter/base/base_mvvm.dart';
import 'package:g_flutter/pages/login/viewmodel.dart';
import 'package:g_flutter/widgets/common/texts.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginWidget extends MultiProviderBaseWidget {
  @override
  Widget buildView(BuildContext context) {
    var vm = viewModel<LoginViewModel>(context);
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

  @override
  List<SingleChildWidget> createProviders(BuildContext context) {
    print("createProviders=================");

    return [
      ChangeNotifierProvider<LoginViewModel>(create: (BuildContext context) {
        return LoginViewModel(333,context: context);
      }),
      ChangeNotifierProxyProvider<LoginViewModel, FatherContentModel>(
        create: (_) {
          return null;
        },
        update: (context, value, previous) {
          if (value == null) return null;
          return value.fcm;
        },
      ),
      ChangeNotifierProxyProvider<FatherContentModel, SonContentModel>(
        create: (_) {
          return null;
        },
        update: (context, value, previous) {
          if (value == null) return null;
          return value.son;
        },
      ),
    ];
  }
}
