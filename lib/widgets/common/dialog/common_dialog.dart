import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/buttons.dart';
import 'package:g_flutter/widgets/common/dialog/base_dialog.dart';
import 'package:g_flutter/widgets/common/lines.dart';
import 'package:g_flutter/widgets/common/texts.dart';

class MyDialog<T> extends BaseDialog<T> {
  String title;
  String message;

  String negativeText;
  T Function(BuildContext dialogContext, MyDialog dialog) onNegativeClick;

  String positiveText;
  T Function(BuildContext dialogContext, MyDialog dialog) onPositiveClick;

  MyDialog({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "取消",
    this.onNegativeClick,
    this.positiveText,
    this.onPositiveClick,
  }) : super(key: key);

  MyDialog.alertYes({
    Key key,
    title,
    @required message,
    negativeText = "确定",
    onNegativeClick,
  }) : this(
            key: key,
            title: title,
            message: message,
            negativeText: negativeText,
            onNegativeClick: onNegativeClick);

  MyDialog.alertEsc({
    Key key,
    title,
    @required message,
    negativeText = "取消",
    onNegativeClick,
  }) : this(
            key: key,
            title: title,
            message: message,
            negativeText: negativeText,
            onNegativeClick: onNegativeClick);

  MyDialog.confirm({
    Key key,
    title,
    @required message,
    negativeText,
    onNegativeClick,
    positiveText = "确定",
    onPositiveClick,
  }) : this(
            key: key,
            title: title,
            message: message,
            negativeText: negativeText,
            onNegativeClick: onNegativeClick,
            positiveText: positiveText,
            onPositiveClick: onPositiveClick);

  @override
  List<Widget> buildView(BuildContext context) {
    return [
      new Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: scaleScreen(context, 0.65),
        ),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(12.0),
              child: MyText.black18(title),
            ),
            Line(
              color: Color(0xffe0e0e0),
            ),
            Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(
                minHeight: scaleScreen(context, 0.1),
              ),
              child: MyText.black16(message),
            ),
            _buildBottomButtonGroup(context),
          ],
        ),
      ),
    ];
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
      child: MyButton.forMyDialog(
        text: negativeText,
        onTap: () {
          T res;
          if (onNegativeClick != null) {
            res = onNegativeClick(context, this);
          }
          pop(context, res);
        },
      ),
    );
  }

  Widget _positiveButton(context) {
    return Flexible(
      fit: FlexFit.tight,
      child: MyButton.forMyDialog(
        text: positiveText,
        onTap: () {
          T res;
          if (onPositiveClick != null) {
            res = onPositiveClick(context, this);
          }
          pop(context, res);
        },
      ),
    );
  }
}
