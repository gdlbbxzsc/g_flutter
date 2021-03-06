import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyChangeNotifierProxyProvider<T, R extends ChangeNotifier>
    extends ChangeNotifierProxyProvider<T, R> {
  MyChangeNotifierProxyProvider({
    Key key,
    @required ProxyProviderBuilder<T, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: (context) => null,
          update: (context, value, previous) {
            if (value == null) return null;
            return update(context, value, previous);
          },
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

//对provider selector的封装
//当监听对象为null，能够返回默认结果省去空判断
//shouldRebuild使用时要慎重，如果它结果为true时的判断要优先于数据比对，如强制返回true，就算数据没有变化也会刷新
class SelectorM<O extends Object, R extends Object> extends Selector<O, R> {
  SelectorM({
    Function(BuildContext context, R value, Widget child) builder,
    Function(BuildContext buildContext, O obj) selector,
    ShouldRebuild<R> shouldRebuild,
    R def,
  }) : super(
          builder: builder,
          selector: (BuildContext buildContext, O obj) {
            if (obj == null) return def;
            R res = selector(buildContext, obj);
            if (res == null) return def;
            return res;
          },
          shouldRebuild: shouldRebuild,
        );
}

//返回数据为List类型时调用
class SelectorL<O extends Object, M extends Object>
    extends SelectorM<O, List<M>> {
  SelectorL({
    Function(BuildContext context, List<M> value, Widget child) builder,
    Function(BuildContext buildContext, O obj) selector,
    ShouldRebuild<List<M>> shouldRebuild,
  }) : super(
          builder: builder,
          selector: selector,
          shouldRebuild: shouldRebuild,
        );
}

//返回数据为string类型时调用
class SelectorS<O extends Object> extends SelectorM<O, String> {
  SelectorS({
    Function(BuildContext context, String value, Widget child) builder,
    Function(BuildContext buildContext, O obj) selector,
    ShouldRebuild<String> shouldRebuild,
    String def = "",
  }) : super(
          builder: builder,
          selector: selector,
          shouldRebuild: shouldRebuild,
          def: def,
        );
}

//int
class SelectorI<O extends Object> extends SelectorM<O, int> {
  SelectorI({
    Function(BuildContext context, int value, Widget child) builder,
    Function(BuildContext buildContext, O obj) selector,
    ShouldRebuild<int> shouldRebuild,
    int def = 0,
  }) : super(
          builder: builder,
          selector: selector,
          shouldRebuild: shouldRebuild,
          def: def,
        );
}

//bool
class SelectorB<O extends Object> extends SelectorM<O, bool> {
  SelectorB({
    Function(BuildContext context, bool value, Widget child) builder,
    Function(BuildContext buildContext, O obj) selector,
    ShouldRebuild<bool> shouldRebuild,
    bool def = false,
  }) : super(
          builder: builder,
          selector: selector,
          shouldRebuild: shouldRebuild,
          def: def,
        );
}
