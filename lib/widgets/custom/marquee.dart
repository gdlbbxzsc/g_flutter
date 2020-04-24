import 'dart:async';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MarqueeWidget extends StatefulWidget {
  final List<Widget> children;

  final double width, height;

  final int animatedMilliseconds; //动画执行时间
  final int intervalMilliseconds; //动画间隔时间

  final AxisDirection direction;

  Function onItemTap;

  MarqueeWidget(
      {Key key,
      @required this.children,
      this.width = double.infinity,
      this.height,
      this.animatedMilliseconds = 550,
      this.intervalMilliseconds = 2000,
      this.direction = AxisDirection.left,
      this.onItemTap});

  @override
  State<StatefulWidget> createState() => _MarqueeState();
}

class _MarqueeState extends State<MarqueeWidget> {
  Timer _timer;
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        Duration(
            milliseconds:
                widget.animatedMilliseconds + widget.intervalMilliseconds),
        (time) => setState(() => _scaleIndex()));
  }

  @override
  void dispose() {
    if (_timer != null) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = List<Widget>(widget.children.length);

    for (int i = 0; i < widget.children.length; i++) {
      _children[i] = SizedBox(
          width: widget.width,
          height: widget.height,
          key: ValueKey<int>(i),
          child: GestureDetector(
              child: widget.children[i],
              onTap: () =>
                  widget.onItemTap != null ? widget.onItemTap(i) : null));
    }
    return ClipRect(
      child: AnimatedSwitcher(
          reverseDuration: Duration(milliseconds: widget.animatedMilliseconds),
          duration: Duration(milliseconds: widget.animatedMilliseconds),
          child: _children[_index],
          transitionBuilder: (Widget child, Animation<double> animation) {
            return _MarqueeTransition(
                child: child, direction: widget.direction, position: animation);
          }),
    );
  }

  void _scaleIndex() {
    _index = ++_index % widget.children.length;
  }
}

// ignore: must_be_immutable
class _MarqueeTransition extends AnimatedWidget {
  final Widget child;

  final bool transformHitTests;

  //退场（出）方向
  final AxisDirection direction;
  Tween<Offset> _tween;

  _MarqueeTransition({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    final double num = 1.5;
    Offset offset;
    switch (direction) {
      case AxisDirection.up:
        offset = Offset(0, num);
        break;
      case AxisDirection.right:
        offset = Offset(-num, 0);
        break;
      case AxisDirection.down:
        offset = Offset(0, -num);
        break;
      case AxisDirection.left:
        offset = Offset(num, 0);
        break;
    }
    _tween = Tween(begin: offset, end: Offset(0, 0));
  }

  Animation<double> get position => listenable;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
        translation: offset,
        transformHitTests: transformHitTests,
        child: child);
  }
}
