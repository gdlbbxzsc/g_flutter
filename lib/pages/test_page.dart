import 'package:flutter/material.dart';
import 'package:g_flutter/route.dart';
import 'package:g_flutter/widgets/common/buttons.dart';
import 'package:g_flutter/widgets/common/dialog.dart';

class TestPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton.forCommonDialog(
            text: "goListPageWidget",
            onTap: () {
              Routes.goListPageWidget(context);
            }),
        SizedBox(height: 10),
        CommonButton.forCommonDialog(
            text: "goLoginPageWidget",
            onTap: () {
              Routes.goLoginPageWidget(context);
            }),
        SizedBox(height: 10),
        CommonButton.forCommonDialog(
            text: "goWelcomeGuidePageWidget",
            onTap: () {
              Routes.goWelcomeGuidePageWidget(context);
            }),
        SizedBox(height: 10),
        CommonButton.forCommonDialog(
            text: "dialog",
            onTap: () {
              CommonDialog<int> //
                      .alert(
                message: "null",
                onNegativeClick: (c, dialog) {
                  dialog.pop(c, 123);
                },
              ) //
                  .show(context: context) //
                  .then((value) {
                print("$value===============");
              });
            }),
      ],
    );
  }
}
