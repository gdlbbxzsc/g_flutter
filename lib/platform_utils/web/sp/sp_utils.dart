import 'dart:html' as html;

import 'package:g_flutter/platform_utils/base/sp/i_sp_options.dart';

class SpUtilWebImpl extends ISpUtil {
  //String
  void putString(String key, String value) {
    if (key == null || value == null) return;
    html.window.localStorage[key] = value;
  }

  String getString(String key, {String def}) {
    if (key == null) return def;
    String res = html.window.localStorage[key];
    if (res == null || res.isEmpty) return def;

    return res;
  }

  String getString0(String key, {String def = ""}) {
    return getString(key, def: def);
  }

//int
  void putInt(String key, int value) {
    if (key == null || value == null) return;
    putString(key + "_int", value.toString());
  }

  int getInt(String key, {int def}) {
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

  int getInt0(String key, {int def = 0}) {
    return getInt(key, def: def);
  }

//double
  void putDouble(String key, double value) {
    if (key == null || value == null) return;
    putString(key + "_Double", value.toString());
  }

  double getDouble(String key, {double def}) {
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

  double getDouble0(String key, {double def = 0}) {
    return getDouble(key, def: def);
  }

  //bool
  void putBool(String key, bool value) {
    if (key == null || value == null) return;
    putString(key + "_Bool", value.toString());
  }

  bool getBool(String key, {bool def}) {
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

  bool getBool0(String key, {bool def = false}) {
    return getBool(key, def: def);
  }

  @override
  get(String key) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  void put(String key, value) {
    // TODO: implement put
  }
}
