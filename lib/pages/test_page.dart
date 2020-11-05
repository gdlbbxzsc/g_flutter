import 'package:flutter/material.dart';
import 'package:g_flutter/route.dart';
import 'package:g_flutter/widgets/common/buttons.dart';
import 'package:g_flutter/widgets/common/dialog/common_dialog.dart';
import 'package:g_flutter/widgets/common/dialog/single_choose_list_dialog.dart';
import 'package:g_flutter/widgets/common/lines.dart';
import 'package:g_flutter/widgets/common/texts.dart';

class TestPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyButton.forMyDialog(
            text: "goListPageWidget",
            onTap: () {
              Routes.goListPageWidget(context);
            }),
        Line.H(),
        MyButton.forMyDialog(
            text: "goLoginPageWidget",
            onTap: () {
              Routes.goLoginPageWidget(context);
            }),
        Line.H(),
        MyButton.forMyDialog(
            text: "goWelcomeGuidePageWidget",
            onTap: () {
              Routes.goWelcomeGuidePageWidget(context);
            }),
        Line.H(),
        MyButton.forMyDialog(
            text: "dialog",
            onTap: () {
              MyDialog //
                  .alertYes(
                message: "test test",
                onNegativeClick: () {
                  Navigator.pop(context);
                },
              ).show(context: context);
            }),
        Line.H(),
        MyButton.forMyDialog(
          text: "list dialog",
          onTap: () {
            SingleChooseListDialog<String>(
              datas: ["test1", "git", "lib", "error", "succ"],
              onCreateItem: (data, index) {
                return MyText.black16(data);
              },
              onChoose: (data, index) {
                // Toast.show(context: context, message: data);
              },
            ).show(context: context);
          },
        ),
      ],
    );
  }
}
