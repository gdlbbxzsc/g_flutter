import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/texts.dart';

class RowFlex extends StatelessWidget {
  final Widget leftChild, rightChild;

  final double verticalPadding, horizontalPadding;
  final int leftFlex, rightFlex;
  final bool top; //控件居上还是居中

  const RowFlex(this.leftChild, this.rightChild,
      {Key key,
      this.leftFlex = 1,
      this.rightFlex = 3,
      this.verticalPadding = 11,
      this.horizontalPadding = 16,
      this.top = false})
      : super(key: key);

  RowFlex.titleContent(String leftChildText, String rightChildText,
      {Key key,
      int leftFlex = 1,
      int rightFlex = 3,
      double verticalPadding = 11,
      double horizontalPadding = 16})
      : this(
          MyText.black16(leftChildText),
          MyText.black16(rightChildText),
          key: key,
          leftFlex: leftFlex,
          rightFlex: rightFlex,
          verticalPadding: verticalPadding,
          horizontalPadding: horizontalPadding,
          top: false,
        );

  RowFlex.titleContentEnd(String leftChildText, String rightChildText,
      {Key key,
      int leftFlex = 1,
      int rightFlex = 3,
      double verticalPadding = 11,
      double horizontalPadding = 16})
      : this(
          MyText.black16(leftChildText),
          MyText.black16(rightChildText, textAlign: TextAlign.end),
          key: key,
          leftFlex: leftFlex,
          rightFlex: rightFlex,
          verticalPadding: verticalPadding,
          horizontalPadding: horizontalPadding,
          top: false,
        );

  RowFlex.titleWidgets(String leftChildText, List<Widget> rightChildren,
      {Key key,
      int leftFlex = 1,
      int rightFlex = 3,
      double verticalPadding = 11,
      double horizontalPadding = 16})
      : this(
          MyText.black16(leftChildText),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: rightChildren),
          key: key,
          leftFlex: leftFlex,
          rightFlex: rightFlex,
          verticalPadding: verticalPadding,
          horizontalPadding: horizontalPadding,
          top: false,
        );

  RowFlex.titleWidgetsEnd(String leftChildText, List<Widget> rightChildren,
      {Key key,
      int leftFlex = 1,
      int rightFlex = 3,
      double verticalPadding = 11,
      double horizontalPadding = 16})
      : this(
          MyText.black16(leftChildText),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: rightChildren),
          key: key,
          leftFlex: leftFlex,
          rightFlex: rightFlex,
          verticalPadding: verticalPadding,
          horizontalPadding: horizontalPadding,
          top: false,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Row(
        crossAxisAlignment:
            top ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(child: leftChild, flex: leftFlex),
          Expanded(child: rightChild, flex: rightFlex),
        ],
      ),
    );
  }
}
