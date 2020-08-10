import 'package:flutter/material.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';
import 'package:g_flutter/widgets/common/app_bars.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseWidget extends StatelessWidget {
  const BaseWidget({Key key}) : super(key: key);

  Widget _buildView(BuildContext context);

  Widget buildViewBody(BuildContext context);
}

///////////////////////////////////////

abstract class ChangeNotifierProviderWidget<T extends BaseViewModel>
    extends BaseWidget {
  const ChangeNotifierProviderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: createViewModel(context),
      child: SafeArea(child: Builder(builder: _buildView)),
    );
  }

  @override
  Widget _buildView(context) {
    return buildViewBody(context);
  }

  T createViewModel(BuildContext context);

  T getViewModel(BuildContext context) =>
      Provider.of<T>(context, listen: false);
}

///////////
abstract class MultiProviderWidget<T extends BaseViewModel>
    extends ChangeNotifierProviderWidget<T> {
  const MultiProviderWidget({Key key}) : super(key: key);

  @override
  Widget _buildView(BuildContext context) {
    return MultiProvider(
      providers: createProviders(context),
      child: Builder(builder: buildViewBody),
    );
  }

  List<SingleChildWidget> createProviders(BuildContext context);

  V getViewModelOf<V extends BaseViewModel>(BuildContext context) =>
      Provider.of<V>(context, listen: false);
}

///////////////////////////////////////

abstract class AppBarChangeNotifierProviderWidget<T extends BaseViewModel>
    extends ChangeNotifierProviderWidget<T> {
  const AppBarChangeNotifierProviderWidget({Key key}) : super(key: key);

  @override
  Widget _buildView(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: buildViewBody(context),
    );
  }

  Widget appBar() => MyAppBar.backBlack("${title()}");

  String title();
}

abstract class AppBarMultiProviderWidget<T extends BaseViewModel>
    extends MultiProviderWidget<T> {
  const AppBarMultiProviderWidget({Key key}) : super(key: key);

  @override
  Widget _buildView(BuildContext context) {
    return MultiProvider(
      providers: createProviders(context),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: appBar(),
          body: buildViewBody(context),
        );
      }),
    );
  }

  Widget appBar() => MyAppBar.backBlack("${title()}");

  String title();
}
