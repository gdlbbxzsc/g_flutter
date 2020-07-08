import 'package:g_flutter/platform/sp/i_sp_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

//因为 SharedPreferences web端没有生效，所以将数据暂存localstofage中
//若生效可免去复杂判断。
class SpUtilMobileImpl extends ISpUtil {
  dynamic get(String key) {
    SharedPreferences.getInstance().then((sp) {
      return sp.get(key);
    });
  }

  void put(String key, dynamic value) {
    SharedPreferences.getInstance().then((sp) {
      if (value is bool) {
        sp.setBool(key, value);
      } else if (value is String) {
        sp.setString(key, value);
      } else if (value is double) {
        sp.setDouble(key, value);
      } else if (value is int) {
        sp.setInt(key, value);
      }
    });
  }

  //String
  void putString(String key, String value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setString(key, value));
  }

  String getString(String key, {String def}) {
    if (key == null) return def;

    SharedPreferences.getInstance().then((sp) {
      String res = sp.getString(key);
      if (res == null || res.isEmpty) return def;
      return res;
    });
  }

  String getString0(String key, {String def = ""}) {
    return getString(key, def: def);
  }

//int
  void putInt(String key, int value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setInt(key, value));
  }

  int getInt(String key, {int def}) {
    if (key == null) return def;

    SharedPreferences.getInstance().then((sp) {
      int res = sp.getInt(key);
      if (res == null) return def;
      return res;
    });
  }

  int getInt0(String key, {int def = 0}) {
    return getInt(key, def: def);
  }

//double
  void putDouble(String key, double value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setDouble(key, value));
  }

  double getDouble(String key, {double def}) {
    if (key == null) return def;

    SharedPreferences.getInstance().then((sp) {
      double res = sp.getDouble(key);
      if (res == null) return def;
      return res;
    });
  }

  double getDouble0(String key, {double def = 0}) {
    return getDouble(key, def: def);
  }

  //bool
  void putBool(String key, bool value) {
    if (key == null || value == null) return;
    SharedPreferences.getInstance().then((sp) => sp.setBool(key, value));
  }

  bool getBool(String key, {bool def}) {
    if (key == null) return def;

    SharedPreferences.getInstance().then((sp) {
      bool res = sp.getBool(key);
      if (res == null) return def;
      return res;
    });
  }

  bool getBool0(String key, {bool def = false}) {
    return getBool(key, def: def);
  }
}
