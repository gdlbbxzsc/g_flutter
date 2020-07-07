import 'package:flutter/material.dart';
import 'package:g_flutter/route.dart';
import 'package:g_flutter/widgets/common/buttons.dart';

class TestPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton.circularWhite12(
            text: "a",
            onTap: () {
              Routes.goListPageWidget(context);
            }),
        CommonButton.circularWhite12(
            text: "a",
            onTap: () {
              Routes.goLoginPageWidget(context);
            }),
        CommonButton.circularWhite12(
            text: "a",
            onTap: () {
              Routes.goWelcomeGuidePageWidget(context);
            }),
      ],
    );
  }
}
