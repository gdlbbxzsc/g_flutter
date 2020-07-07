import 'package:flutter/cupertino.dart';
import 'package:g_flutter/base/mvvm/view_model.dart';
import 'package:provider/provider.dart';

//如果有重要数据 需要 全局使用，请在init和destroy中进行获取和存储
//比如在web下 刷新后此application 是重新创建的。
class Application extends BaseViewModel {
  String string = "社会我凡哥";

  static Application getInstance(BuildContext context) {
    return Provider.of<Application>(context, listen: false);
  }

  Application() : super();

  @override
  void initViewModel() {}

  @override
  void destroyViewModel() {}
}
