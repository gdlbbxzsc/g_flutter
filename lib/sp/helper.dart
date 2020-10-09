//因为 SharedPreferences web端没有生效，所以将数据暂存localstofage中
//若生效可免去复杂判断。

import 'package:g_flutter/sp/base.dart';
import 'package:g_flutter/sp/sp_mobile.dart';
import 'package:g_flutter/sp/sp_web.dart';
import 'package:g_flutter/utils/platform_util.dart';

class SpHelper extends ISpOption {
  factory SpHelper.getInstance() => _instance;
  static final SpHelper _instance = SpHelper._init();

  ISpOption _iSpUtil;

  SpHelper._init() {
    if (PlatformUtil.isWeb) {
      _iSpUtil = new WebSpOptionImpl();
    } else {
      _iSpUtil = new MobileSpOptionImpl();
    }
  }

  @override
  dynamic getBool(String key, {bool def}) {
    return _iSpUtil.getBool(key, def: def);
  }

  @override
  dynamic getDouble(String key, {double def}) {
    return _iSpUtil.getDouble(key, def: def);
  }

  @override
  dynamic getInt(String key, {int def}) {
    return _iSpUtil.getInt(key, def: def);
  }

  @override
  dynamic getString(String key, {String def}) {
    return _iSpUtil.getString(key, def: def);
  }

  @override
  void putBool(String key, bool value) {
    _iSpUtil.putBool(key, value);
  }

  @override
  void putDouble(String key, double value) {
    _iSpUtil.putDouble(key, value);
  }

  @override
  void putInt(String key, int value) {
    _iSpUtil.putInt(key, value);
  }

  @override
  void putString(String key, String value) {
    _iSpUtil.putString(key, value);
  }
}
