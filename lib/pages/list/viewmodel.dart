import 'package:g_flutter/base/mvvm/view_model.dart';
import 'package:g_flutter/pages/list/refresh_viewmodel.dart';

import 'model.dart';

class ListViewModel extends BaseViewModel {
  final ListModel _model = ListModel();

  final RefreshViewModel refreshViewModel = RefreshViewModel(() async {
//    获取数据并返回
//    _model.
    return [];
  });

  ListViewModel({context}) : super(context: context);

  @override
  void initViewModel() {}

  @override
  void destroyViewModel() {}
}
