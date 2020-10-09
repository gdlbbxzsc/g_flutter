import 'dart:html' as html;

import 'package:g_flutter/sp/base.dart';

class WebSpOptionImpl extends ISpOption {
  //String
  void putString(String key, String value) {
    if (key == null || value == null) return;
    html.window.localStorage[key] = value;
  }

  @override
  String getString(String key, {String def = ""}) {
    if (key == null) return def;
    String res = html.window.localStorage[key];
    if (res == null || res.isEmpty) return def;

    return res;
  }

//int
  void putInt(String key, int value) {
    if (key == null || value == null) return;
    putString(key + "_int", value.toString());
  }

  @override
  int getInt(String key, {int def = 0}) {
    if (key == null) return def;
    String temp =
        getString(key + "_Int", def: def == null ? null : def.toString());
    if (temp == null || temp.isEmpty) return def;

    try {
      return int.parse(temp);
    } catch (e) {
      print(e);
      return def;
    }
  }

//double
  void putDouble(String key, double value) {
    if (key == null || value == null) return;
    putString(key + "_Double", value.toString());
  }

  @override
  double getDouble(String key, {double def = 0}) {
    if (key == null) return def;
    String temp =
        getString(key + "_Double", def: def == null ? null : def.toString());
    if (temp == null || temp.isEmpty) return def;

    try {
      return double.parse(temp);
    } catch (e) {
      print(e);
      return def;
    }
  }

  //bool
  void putBool(String key, bool value) {
    if (key == null || value == null) return;
    putString(key + "_Bool", value.toString());
  }

  @override
  bool getBool(String key, {bool def = false}) {
    if (key == null) return def;
    String temp =
        getString(key + "_Bool", def: def == null ? null : def.toString());
    if (temp == null || temp.isEmpty) return def;

    try {
      return temp == "true";
    } catch (e) {
      print(e);
      return def;
    }
  }
}
