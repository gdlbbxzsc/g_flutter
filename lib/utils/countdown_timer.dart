import 'dart:async';

import 'package:flutter/cupertino.dart';

typedef void OnTick(int millisUntilFinished);

class CountDownTimer {
  CountDownTimer(
      {this.interval = Duration.millisecondsPerSecond,
      @required this.totalTime,
      @required this.onTick});

  int interval; // Timer间隔 单位毫秒，默认1000毫秒(1秒).
  int totalTime; //单位毫秒 倒计时总时间
  OnTick onTick;

  Timer _timer;
  bool _active = false;

  void start() {
    if (_active || interval <= 0 || totalTime <= 0) return;
    _active = true;

    onTick(totalTime);

    _timer = Timer.periodic(Duration(milliseconds: interval), (Timer timer) {
      totalTime -= interval;

      if (totalTime >= interval) {
        onTick(totalTime);
        return;
      }

      if (totalTime <= 0) {
        onTick(0);
        cancel();
        return;
      }

      timer.cancel();
      Future.delayed(Duration(milliseconds: totalTime), () {
        onTick(0);
        cancel();
      });
    });
  }

  void cancel() {
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = null;
    _active = false;
  }
}
