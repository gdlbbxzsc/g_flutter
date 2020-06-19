import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseViewModel with ChangeNotifier {
  BaseViewModel() {
    init();
  }

  void init();
}

abstract class BaseWidget extends StatelessWidget {
  Widget buildView(BuildContext context);
}

abstract class MultiProviderBaseWidget extends BaseWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createProviders(),
      child: Builder(builder: buildView),
    );
  }

  List<SingleChildWidget> createProviders();

  T viewModel<T extends BaseViewModel>(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }
}

abstract class ChangeNotifierProviderBaseWidget<T extends BaseViewModel>
    extends BaseWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: createViewModel(),
      child: Builder(builder: buildView),
    );
  }

  T createViewModel();

  T viewModel(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }
}
