import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//对provider selector的封装
//当监听对象为null，能够返回默认结果省去空判断
class SelectorM<O extends Object, R extends Object> extends Selector<O, R> {
  SelectorM(
      {Function(BuildContext context, R value, Widget child) builder,
      Function(BuildContext buildContext, O obj) selector,
      R def})
      : super(
            builder: builder,
            selector: (BuildContext buildContext, O obj) {
              if (obj == null) return def;
              return selector(buildContext, obj);
            });
}

//返回数据为string类型时调用
class SelectorS<O extends Object> extends Selector<O, String> {
  SelectorS(
      {Function(BuildContext context, String value, Widget child) builder,
      Function(BuildContext buildContext, O obj) selector,
      String def = ""})
      : super(
            builder: builder,
            selector: (BuildContext buildContext, O obj) {
              if (obj == null) return def;
              return selector(buildContext, obj);
            });
}

//int
class SelectorI<O extends Object> extends Selector<O, int> {
  SelectorI(
      {Function(BuildContext context, int value, Widget child) builder,
      Function(BuildContext buildContext, O obj) selector,
      int def = 0})
      : super(
            builder: builder,
            selector: (BuildContext buildContext, O obj) {
              if (obj == null) return def;
              return selector(buildContext, obj);
            });
}

//bool
class SelectorB<O extends Object> extends Selector<O, bool> {
  SelectorB(
      {Function(BuildContext context, bool value, Widget child) builder,
      Function(BuildContext buildContext, O obj) selector,
      bool def = false})
      : super(
            builder: builder,
            selector: (BuildContext buildContext, O obj) {
              if (obj == null) return def;
              return selector(buildContext, obj);
            });
}
