//因为 SharedPreferences web端没有生效，所以将数据暂存localstofage中
//若生效可免去复杂判断。
import 'package:g_flutter/platform_utils/base/sp/i_sp_options.dart';
import 'package:g_flutter/platform_utils/mobile/sp/sp_utils.dart';
import 'package:g_flutter/platform_utils/platform_util.dart';
import 'package:g_flutter/platform_utils/web/sp/sp_utils.dart';

class SpHelper extends ISpUtil {
  factory SpHelper.getInstance() => _instance;
  static final SpHelper _instance = SpHelper._init();

  ISpUtil _iSpUtil;

  SpHelper._init() {
    if (PlatformUtil.isWeb) {
      _iSpUtil = new SpUtilWebImpl();
    } else {
      _iSpUtil = new SpUtilMobileImpl();
    }
  }

  @override
  get(String key) {
    return _iSpUtil.get(key);
  }

  @override
  bool getBool(String key, {bool def}) {
    return _iSpUtil.getBool(key, def: def);
  }

  @override
  bool getBool0(String key, {bool def = false}) {
    return _iSpUtil.getBool0(key, def: def);
  }

  @override
  double getDouble(String key, {double def}) {
    return _iSpUtil.getDouble(key, def: def);
  }

  @override
  double getDouble0(String key, {double def = 0}) {
    return _iSpUtil.getDouble0(key, def: def);
  }

  @override
  int getInt(String key, {int def}) {
    return _iSpUtil.getInt(key, def: def);
  }

  @override
  int getInt0(String key, {int def = 0}) {
    return _iSpUtil.getInt0(key, def: def);
  }

  @override
  String getString(String key, {String def}) {
    return _iSpUtil.getString(key, def: def);
  }

  @override
  String getString0(String key, {String def = ""}) {
    return _iSpUtil.getString0(key, def: def);
  }

  @override
  void put(String key, value) {
    _iSpUtil.put(key, value);
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
