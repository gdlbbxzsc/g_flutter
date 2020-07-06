

import 'package:flutter/material.dart';

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
///////////////////////////////////////
class ContentViewModel extends BaseViewModel {
  ContentViewModel({context}) : super(context: context);

  @override
  void destroyViewModel() {}

  @override
  void initViewModel() {}
}