//一个圆点
import 'package:flutter/material.dart';

class Point extends SizedBox {
  Point({
    double size = 10,
    double borderWidth = 1,
    Color color = const Color(0xFFD6D6D6),
    Color borderColor,
    double topLeft = 50,
    double topRight = 50,
    double bottomLeft = 50,
    double bottomRight = 50,
  }) : super(
          width: size,
          height: size,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              border: Border.all(
                  color: borderColor == null ? color : borderColor,
                  width: borderWidth,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(topLeft),
                  topRight: Radius.circular(topRight),
                  bottomLeft: Radius.circular(bottomLeft),
                  bottomRight: Radius.circular(bottomRight)),
            ),
          ),
        );
}
