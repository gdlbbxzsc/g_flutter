import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends Text {
  const MyText(String data) : super(data);

  MyText.black16(
    String data, {
    int maxLines,
    TextAlign textAlign = TextAlign.start,
    FontWeight fontWeight = FontWeight.w400,
  }) : super(data,
            maxLines: maxLines,
            textAlign: textAlign,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: fontWeight,
            ));

  const MyText.high(String data)
      : super(data,
            style: const TextStyle(
                letterSpacing: 3,
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w800,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 2.0), //阴影xy轴偏移量
                    blurRadius: 4.0, //延伸距离,会有模糊效果
//                        spreadRadius: 1000.0 //延伸距离,不会有模糊效果
                  )
                ]));

  const MyText.lineSpace(String data)
      : super(data,
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
              height: 1.2,
            ),
            style: const TextStyle(
                letterSpacing: 1,
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600));
}
