import 'package:flutter/material.dart';

//一条实线
class Line extends SizedBox {
  Line(
      {double width = double.infinity,
      double height = 1,
      Color color = const Color(0xFFD6D6D6)})
      : super(
          width: width,
          height: height,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        );
}

///通过文字删除线实现虚线
class LineDashText extends StatelessWidget {
  final double width;

  final double dashWidth;
  final Color color;

  const LineDashText(
      {Key key,
      this.width = double.infinity,
      this.color = Colors.red,
      this.dashWidth = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: ClipRect(
          child: Text(
              "                                                                                                                                                                                                                                 ",
              maxLines: 1,
              strutStyle: StrutStyle(
                  forceStrutHeight: true,
                  fontSize: dashWidth,
                  height: 1,
                  leading: 0),
              style: TextStyle(
                fontSize: dashWidth,
                decoration: TextDecoration.lineThrough,
                decorationColor: color,
                decorationStyle: TextDecorationStyle.dashed,
              )),
        ));
  }
}

///图片重复实现虚线
class LineDashImg extends Image {
  LineDashImg()
      : super(
            width: double.infinity,
            height: 1,
            repeat: ImageRepeat.repeatX,
            image: new AssetImage("img/dash.jpg"));
}

///自定义画布 虚线
//class LineDash extends StatelessWidget {
//  final double dashWidth, dashHeight, spaceWidth;
//  final Color color;
//
//  const LineDash(
//      {Key key,
//      this.dashWidth = 5,
//      this.dashHeight = 1,
//      this.spaceWidth = 5,
//      this.color = Colors.green})
//      : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return CustomPaint(
//      // size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸
//      size: Size(MediaQuery.of(context).size.width, dashHeight),
//
//      painter: LineDashPainter(dashWidth, dashHeight, spaceWidth, color),
//    );
//  }
//}
//
//class LineDashPainter extends CustomPainter {
//  final double dashWidth, dashHeight, spaceWidth;
//  final Color color;
//
//  LineDashPainter(this.dashWidth, this.dashHeight, this.spaceWidth, this.color);
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    final paint = Paint() // 创建一个画笔并配置其属性
//      ..color = color // 画笔颜色
//      ..strokeWidth = dashHeight // 画笔的宽度
//      ..isAntiAlias = true; // 是否抗锯齿
//
//    final max = size.width; // size获取到宽度
//
//    double startX = 0;
//    final space = spaceWidth + dashWidth;
//
//    while (startX < max) {
//      canvas.drawLine(
//          Offset(startX, 100.0), Offset(startX + dashWidth, 100.0), paint);
//      startX += space;
//    }
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) => false;
//}
