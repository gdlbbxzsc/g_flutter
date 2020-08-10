import 'package:g_flutter/base/list/refresh_viewmodel.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';

import 'model.dart';

class ListViewModel extends BaseViewModel {
  final ListModel _model = ListModel();

  final RefreshViewModel<String> refreshViewModel =
      RefreshViewModel<String>(() async {
//    获取数据并返回
//    _model.
    return ["1", "2", "3", "4", "5"];
  });

  ListViewModel({context}) : super(context: context);

  @override
  void initViewModel() {}

  @override
  void destroyViewModel() {}
}
