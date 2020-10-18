import 'package:flutter/material.dart';

abstract class BaseDialog extends Dialog {
  const BaseDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: buildView(context),
      ),
    );
  }

  Future<dynamic> show({
    @required BuildContext context,
    WidgetBuilder builder,
    bool barrierDismissible = true,
    Color barrierColor,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings routeSettings,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      // barrierColor: barrierColor,
      // useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) => this,
    ).then((value) {
      return doThen(value);
    });
  }

  void pop(BuildContext context, [bool result]) {
    Navigator.pop(context, result);
  }

  double scaleScreen(BuildContext context, double resultScreenRatio,
      {double source, bool useWidth = true}) {
    if (resultScreenRatio == null) resultScreenRatio = 0.75;
    if (source == null) {
      var size = MediaQuery.of(context).size;
      source = useWidth ? size.width : size.height;
    }
    return source * resultScreenRatio;
  }

  //fromXScaleY 通过宽计算出高 or 通过高计算宽
  //resultScreenRatio: fromXScaleY==true ? x/screenwidth : y/screenheight
  //x/screenwidth: 期望的宽x 和 屏幕宽 的比
  //y/screenheight: 期望的高y 和 屏幕高 的比
  //xyRatio: 期望的宽x 和 期望的高y 的比
  //例：通过屏幕算出宽，再由宽计算出高
  List<double> getWH(
    BuildContext context,
    double resultScreenRatio,
    double xyRatio, {
    double source,
    bool fromXScaleY = true,
  }) {
    if (xyRatio == null) xyRatio = 10 / 7;

    double x, y;
    if (fromXScaleY) {
      x = scaleScreen(context, resultScreenRatio, source: source);
      y = x / xyRatio;
    } else {
      y = scaleScreen(context, resultScreenRatio,
          source: source, useWidth: false);
      x = y * xyRatio;
    }
    return [x, y];
  }

  BoxConstraints getBoxConstraints(BuildContext context) {
    var mins = getWH(context, 0.65, 10 / 3);
    var maxs = getWH(context, 0.65, 10 / 12);

    return BoxConstraints(
      minWidth: mins[0],
      minHeight: mins[1],
      //
      maxWidth: maxs[0],
      maxHeight: maxs[1],
    );
  }

  List<Widget> buildView(BuildContext context);

  void doThen(bool b);
}
