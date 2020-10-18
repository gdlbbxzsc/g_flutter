import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/buttons.dart';
import 'package:g_flutter/widgets/common/dialog/base_dialog.dart';
import 'package:g_flutter/widgets/common/lines.dart';
import 'package:g_flutter/widgets/common/texts.dart';

class MyDialog extends BaseDialog {
  String title;
  String message;

  String negativeText;
  void Function() onNegativeClick;

  String positiveText;
  void Function() onPositiveClick;

  MyDialog.alertYes({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "确定",
    this.onNegativeClick,
  }) : super(key: key);

  MyDialog.alertEsc({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "取消",
    this.onNegativeClick,
  }) : super(key: key);

  MyDialog.confirm({
    Key key,
    this.title = "提示",
    @required this.message,
    this.negativeText = "取消",
    this.onNegativeClick,
    this.positiveText = "确定",
    this.onPositiveClick,
  }) : super(key: key);

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

  @override
  void doThen(bool b) {
    if (b) {
      onPositiveClick();
    } else {
      onNegativeClick();
    }
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
          pop(context, false);
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
          pop(context, true);
        },
      ),
    );
  }
}
