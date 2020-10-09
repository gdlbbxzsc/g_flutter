import 'package:g_flutter/sp/base.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MobileSpOptionImpl extends ISpOption {
  //String
  void putString(String key, String value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setString(key, value));
  }

  @override
  dynamic getString(String key, {String def = ""}) async {
    if (key == null) return def;

    return SharedPreferences.getInstance().then((sp) {
      String res = sp.getString(key);
      if (res == null || res.isEmpty) return def;
      return res;
    });
  }

//int
  void putInt(String key, int value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setInt(key, value));
  }

  @override
  dynamic getInt(String key, {int def = 0}) async {
    if (key == null) return def;

    return SharedPreferences.getInstance().then((sp) {
      int res = sp.getInt(key);
      if (res == null) return def;
      return res;
    });
  }

//double
  void putDouble(String key, double value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setDouble(key, value));
  }

  @override
  dynamic getDouble(String key, {double def = 0}) async {
    if (key == null) return def;

    return SharedPreferences.getInstance().then((sp) {
      double res = sp.getDouble(key);
      if (res == null) return def;
      return res;
    });
  }

  //bool
  void putBool(String key, bool value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setBool(key, value));
  }

  @override
  dynamic getBool(String key, {bool def = false}) async {
    if (key == null) return def;

    return SharedPreferences.getInstance().then((sp) {
      bool res = sp.getBool(key);
      if (res == null) return def;
      return res;
    });
  }
}
