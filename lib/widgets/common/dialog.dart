import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taochaoshi/widgets/common/buttons.dart';
import 'package:taochaoshi/widgets/common/lines.dart';
import 'package:taochaoshi/widgets/common/texts.dart';

class CommonDialog extends Dialog {
  String title;
  String message;

  String negativeText;
  Function onNegativeClick;

  String positiveText;
  Function onpositiveClick;

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
          if (onNegativeClick != null) onNegativeClick();
          Navigator.pop(context);
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
          if (onpositiveClick != null) onpositiveClick();
          Navigator.pop(context);
        },
      ),
    );
  }
}
