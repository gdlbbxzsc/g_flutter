import 'package:g_flutter/base/mvvm/view_model.dart';

//如果有重要数据 需要 全局使用，请在init和destroy中进行获取和存储
//比如在web下 刷新后此application 是重新创建的。
class Application extends BaseViewModel {
  String string = "社会我凡哥";

  Application() : super();

  @override
  void initViewModel() {}

  @override
  void destroyViewModel() {}
}
