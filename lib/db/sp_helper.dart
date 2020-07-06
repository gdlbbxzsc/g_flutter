import 'dart:html' as html;

import 'package:g_flutter/utils/platform_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

//因为 SharedPreferences web端没有生效，所以将数据暂存localstofage中
//若生效可免去复杂判断。
class SpHelper {
  static final SpHelper _instance = SpHelper._init();

  SpHelper._init();

  factory SpHelper.getInstance() => _instance;

  dynamic getSpData(String key) {
    if (PlatformUtil.isWeb) {
      return html.window.localStorage[key];
    } else {
      SharedPreferences.getInstance().then((sp) {
        return sp.get(key);
      });
    }
  }

  void setSpData(String key, dynamic value) {
    if (PlatformUtil.isWeb) {
      html.window.localStorage[key] = value;
    } else {
      SharedPreferences.getInstance().then((sp) {
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
      });
    }
  }

//  String getToken() {
//    return getSpData(SharedPreferencesKeyConstant.TOKEN);
//  }
//
//  void setToken(String token) {
//    setSpData(SharedPreferencesKeyConstant.TOKEN, token);
//  }
//
//  String getPublicKey() {
//    return getSpData(SharedPreferencesKeyConstant.PUBLICKEY);
//  }
//
//  void setPublicKey(String publicKey) {
//    setSpData(SharedPreferencesKeyConstant.PUBLICKEY, publicKey);
//  }
}
