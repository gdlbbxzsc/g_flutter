//通用标题栏
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
//  只带标题
  MyAppBar(String text,
      {Color titleColor = Colors.black,
      Color backgroundColor = Colors.white,
      Widget leading,
      PreferredSizeWidget bottom})
      : super(
            backgroundColor: backgroundColor,
            leading: leading,
            centerTitle: true,
            title: new Text(
              text,
              style: TextStyle(fontSize: 18, color: titleColor),
            ),
            bottom: bottom);

  MyAppBar.backBlack(String text,
      {titleColor = Colors.black,
      backgroundColor = Colors.white,
      onBackPressed,
      bottom})
      : this(text,
            titleColor: titleColor,
            backgroundColor: backgroundColor,
            leading: BackButtonIos(
              color: titleColor,
              onPressed: onBackPressed,
            ),
            bottom: bottom);

  MyAppBar.backWhite(String text,
      {titleColor = Colors.white,
      backgroundColor = Colors.redAccent,
      onBackPressed,
      bottom})
      : this(text,
            titleColor: titleColor,
            backgroundColor: backgroundColor,
            leading: BackButtonIos(
              color: titleColor,
              onPressed: onBackPressed,
            ),
            bottom: bottom);
}

class BackButtonIos extends StatelessWidget {
  final Color color;
  final Function() onPressed;

  const BackButtonIos(
      {Key key, this.onPressed, this.color = const Color(0xff000000)})
      : super(key: key);

  const BackButtonIos.black(
      {Key key, this.onPressed, this.color = const Color(0xff000000)})
      : super(key: key);

  const BackButtonIos.white(
      {Key key, this.onPressed, this.color = const Color(0xffffffff)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: color),
      onPressed: () {
        if (onPressed != null) onPressed();
        Navigator.pop(context);
      },
    );
  }
}
