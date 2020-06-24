import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseViewModel with ChangeNotifier {
  BuildContext context;

  BaseViewModel({this.context}) {
    initViewModel();
  }

  setContext(BuildContext context) {
    this.context = context;
  }

  void initViewModel();

  void destroyViewModel();

  @override
  void dispose() {
    destroyViewModel();
    context = null;
    super.dispose();
  }
}

class ContentViewModel extends BaseViewModel {
  ContentViewModel({context}) : super(context: context);

  @override
  void destroyViewModel() {}

  @override
  void initViewModel() {}
}

abstract class BaseWidget extends StatelessWidget {
  Widget buildView(BuildContext context);
}

abstract class MultiProviderBaseWidget extends BaseWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: createProviders(context),
      child: Builder(builder: buildView),
    );
  }

  List<SingleChildWidget> createProviders(BuildContext context);

  T viewModel<T extends BaseViewModel>(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }
}

abstract class ChangeNotifierProviderBaseWidget<T extends BaseViewModel>
    extends BaseWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: createViewModel(context),
      child: Builder(builder: buildView),
    );
  }

  T createViewModel(BuildContext context);

  T viewModel(BuildContext context) {
    return Provider.of<T>(context, listen: false);
  }
}
