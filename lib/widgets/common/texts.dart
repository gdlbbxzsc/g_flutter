import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends Text {
  const MyText(String data) : super(data);

  const MyText.black13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.black));

  const MyText.black16(String data)
      : super(data, style: const TextStyle(fontSize: 16, color: Colors.black));

  const MyText.black16Center(String data)
      : super(data,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black));

  const MyText.black18(String data)
      : super(data, style: const TextStyle(fontSize: 18, color: Colors.black));

  const MyText.black22(String data)
      : super(data,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700));

  const MyText.red13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.red));

  const MyText.red16(String data)
      : super(data, style: const TextStyle(fontSize: 16, color: Colors.red));

  const MyText.red26(String data)
      : super(data, style: const TextStyle(fontSize: 26, color: Colors.red));

  const MyText.grey13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.grey));

  const MyText.grey16(String data)
      : super(data, style: const TextStyle(fontSize: 16, color: Colors.grey));

  const MyText.white13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.white));

  const MyText.invitationWhiteL(String data)
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

  const MyText.invitationWhiteM(String data)
      : super(data,
            style: const TextStyle(
                letterSpacing: 3,
                fontSize: 22,
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

  const MyText.invitationWhiteS(String data)
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

  const MyText.invitationYellowL(String data)
      : super(data,
            style: const TextStyle(
                letterSpacing: 3,
                fontSize: 38,
                color: Colors.yellow,
                fontWeight: FontWeight.w800,
                shadows: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 2.0), //阴影xy轴偏移量
                    blurRadius: 4.0, //延伸距离,会有模糊效果
//                        spreadRadius: 1000.0 //延伸距离,不会有模糊效果
                  )
                ]));

  const MyText.invitationYellowS(String data)
      : super(data, style: const TextStyle(fontSize: 10, color: Colors.yellow));
}
