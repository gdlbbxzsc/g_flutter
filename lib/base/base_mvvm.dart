import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseViewModel with ChangeNotifier {
  BaseViewModel() {
    init();
  }

  void init();
}

// ignore: must_be_immutable
abstract class BaseWidget<T extends BaseViewModel> extends StatelessWidget {
  T viewModel;

  BaseWidget({Key key}) : super(key: key) {
    viewModel = createViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: viewModel,
//      child: Selector<T, bool>(
//        selector: (_, T) => T.created,
//        builder: (BuildContext context, value, Widget child) {
//          return value ? buildView(context) : initView(context);
//        },
//      ),
      child: buildView(context),
    );
  }

//  Widget initView(BuildContext context);
  T createViewModel();

  Widget buildView(BuildContext context);
}
