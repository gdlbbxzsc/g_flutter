import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/buttons.dart';
import 'package:g_flutter/widgets/common/lines.dart';
import 'package:g_flutter/widgets/common/texts.dart';

// ignore: must_be_immutable
class CommonDialog<T> extends Dialog {
  String title;
  String message;

  String negativeText;
  Function(BuildContext dialogContext, CommonDialog dialog) onNegativeClick;

  String positiveText;
  Function(BuildContext dialogContext, CommonDialog dialog) onpositiveClick;

  CommonDialog({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "取消",
    this.onNegativeClick,
    this.positiveText,
    this.onpositiveClick,
  }) : super(key: key);

  CommonDialog.alert({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "取消",
    this.onNegativeClick,
  }) : super(key: key);

  CommonDialog.confirm({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "取消",
    this.onNegativeClick,
    this.positiveText = "确定",
    this.onpositiveClick,
  }) : super(key: key);

  Future<T> show({
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
      barrierColor: barrierColor,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) => this,
    );
  }

  void pop(BuildContext context, [T result]) {
    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    const margin = 40.0;
//    根据屏幕宽度估算一个屏幕高度
    double minHeight = MediaQuery.of(context).size.width;
    minHeight = minHeight - margin * 2;
    minHeight = minHeight * 1 / 4;

    return new Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            margin: const EdgeInsets.all(margin),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CommonText.black18(title),
                ),
                Line(
                  color: Color(0xffe0e0e0),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12.0),
                  constraints: BoxConstraints(
                    minHeight: minHeight,
                  ),
                  child: CommonText.black16(message),
                ),
                _buildBottomButtonGroup(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtonGroup(context) {
    var buttons = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty)
      buttons.add(_negativeButton(context));
    if (positiveText != null && positiveText.isNotEmpty)
      buttons.add(_positiveButton(context));
    if (buttons.length == 2) buttons.insert(1, SizedBox(width: 20));
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: new Row(
        children: buttons,
      ),
    );
  }

  Widget _negativeButton(context) {
    return Flexible(
      fit: FlexFit.tight,
      child: CommonButton.forCommonDialog(
        text: negativeText,
        onTap: () {
          if (onNegativeClick != null) {
            onNegativeClick(context, this);
            return;
          }
          pop(context);
        },
      ),
    );
  }

  Widget _positiveButton(context) {
    return Flexible(
      fit: FlexFit.tight,
      child: CommonButton.forCommonDialog(
        text: positiveText,
        onTap: () {
          if (onpositiveClick != null) {
            onpositiveClick(context, this);
            return;
          }
          pop(context);
        },
      ),
    );
  }
}
