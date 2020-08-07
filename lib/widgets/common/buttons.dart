import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key key,
      this.text = "确定",
      this.fontSize,
      this.fontColor,
      this.backGroundColor = Colors.white,
      this.borderColor = Colors.grey,
      this.width,
      this.height,
      this.paddingTB = 0,
      this.paddingLR = 18,
      this.borderRadius = 6,
      this.onTap})
      : super(key: key);

  const MyButton.circularGrey12(
      {Key key,
      this.text = "确定",
      this.fontSize = 12,
      this.fontColor = Colors.grey,
      this.backGroundColor = const Color(0xFFF5F5F5),
      this.borderColor = const Color(0xFFBDBDBD),
      this.width,
      this.height,
      this.paddingTB = 0,
      this.paddingLR = 18,
      this.borderRadius = 50,
      this.onTap})
      : super(key: key);

  const MyButton.circularWhite12(
      {Key key,
      this.text = "确定",
      this.fontSize = 12,
      this.fontColor = Colors.black,
      this.backGroundColor = Colors.white,
      this.borderColor = const Color(0xFFBDBDBD),
      this.width,
      this.height,
      this.paddingTB = 0,
      this.paddingLR = 8,
      this.borderRadius = 50,
      this.onTap})
      : super(key: key);

  const MyButton.forMyDialog(
      {Key key,
      this.text = "取消",
      this.fontSize = 15,
      this.fontColor = Colors.white,
      this.backGroundColor = Colors.red,
      this.borderColor = Colors.red,
      this.width,
      this.height,
      this.paddingTB = 6,
      this.paddingLR = 12,
      this.borderRadius = 50,
      this.onTap})
      : super(key: key);

  final String text;

  final double fontSize;
  final Color fontColor;

  final Color backGroundColor;
  final Color borderColor;

  final double width, height;
  final double paddingTB, paddingLR;

  final double borderRadius;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
        padding:
            EdgeInsets.symmetric(vertical: paddingTB, horizontal: paddingLR),
        decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(
              color: borderColor, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(
              Radius.circular(borderRadius == null ? 0 : borderRadius)),
        ),
      ),
    );
  }
}
