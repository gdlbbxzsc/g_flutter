import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonText extends Text {
  const CommonText(String data) : super(data);

  const CommonText.black13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.black));

  const CommonText.black16(String data)
      : super(data, style: const TextStyle(fontSize: 16, color: Colors.black));

  const CommonText.black16Center(String data)
      : super(data,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Colors.black));

  const CommonText.black18(String data)
      : super(data, style: const TextStyle(fontSize: 18, color: Colors.black));

  const CommonText.black22(String data)
      : super(data,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.w700));

  const CommonText.red13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.red));

  const CommonText.red16(String data)
      : super(data, style: const TextStyle(fontSize: 16, color: Colors.red));

  const CommonText.red26(String data)
      : super(data, style: const TextStyle(fontSize: 26, color: Colors.red));

  const CommonText.grey13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.grey));

  const CommonText.grey16(String data)
      : super(data, style: const TextStyle(fontSize: 16, color: Colors.grey));

  const CommonText.white13(String data)
      : super(data, style: const TextStyle(fontSize: 13, color: Colors.white));

  const CommonText.invitationWhiteL(String data)
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

  const CommonText.invitationWhiteM(String data)
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

  const CommonText.invitationWhiteS(String data)
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

  const CommonText.invitationYellowL(String data)
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

  const CommonText.invitationYellowS(String data)
      : super(data, style: const TextStyle(fontSize: 10, color: Colors.yellow));
}
