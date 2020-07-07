import 'package:flutter/material.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';
import 'package:g_flutter/widgets/common/app_bars.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseWidget extends StatelessWidget {
  const BaseWidget({Key key}) : super(key: key);

  Widget buildView(BuildContext context);
}

///////////////////////////////////////
abstract class MultiProviderWidget extends BaseWidget {
  const MultiProviderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createProviders(context),
      child: Builder(builder: buildView),
    );
  }

  List<SingleChildWidget> createProviders(BuildContext context);

  T getViewModel<T extends BaseViewModel>(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }
}

abstract class ChangeNotifierProviderWidget<T extends BaseViewModel>
    extends BaseWidget {
  const ChangeNotifierProviderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: createViewModel(context),
      child: Builder(builder: buildView),
    );
  }

  T createViewModel(BuildContext context);

  T getViewModel(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }
}
///////////////////////////////////////

abstract class AppBarMultiProviderWidget extends MultiProviderWidget {
  const AppBarMultiProviderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createProviders(context),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: appBar(),
          body: buildView(context),
        );
      }),
    );
  }

  Widget appBar() {
    return CommonAppBar.backBlack("${title()}");
  }

  String title();
}

abstract class AppBarChangeNotifierProviderWidget<T extends BaseViewModel>
    extends ChangeNotifierProviderWidget {
  const AppBarChangeNotifierProviderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: createViewModel(context),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: appBar(),
          body: buildView(context),
        );
      }),
    );
  }

  Widget appBar() {
    return CommonAppBar.backBlack("${title()}");
  }

  String title();
}

///////////////////////////////////////

//abstract class BaseState<W extends StatefulWidget> extends State<W> {
//  Widget buildView(BuildContext context);
//}
//
//abstract class MultiProviderState<W extends StatefulWidget>
//    extends BaseState<W> {
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: createProviders(context),
//      child: Builder(builder: buildView),
//    );
//  }
//
//  List<SingleChildWidget> createProviders(BuildContext context);
//
//  T getViewModel<T extends BaseViewModel>(BuildContext context) {
//    return Provider.of<T>(context, listen: false);
//  }
//}
//
//abstract class ChangeNotifierProviderState<W extends StatefulWidget,
//    T extends BaseViewModel> extends BaseState<W> {
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<T>.value(
//      value: createViewModel(context),
//      child: Builder(builder: buildView),
//    );
//  }
//
//  T createViewModel(BuildContext context);
//
//  T getViewModel(BuildContext context) {
//    return Provider.of<T>(context, listen: false);
//  }
//}
