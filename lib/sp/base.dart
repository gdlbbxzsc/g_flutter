abstract class ISpOption {
  dynamic getString(String key, {String def = ""});

  dynamic getInt(String key, {int def = 0});

  dynamic getDouble(String key, {double def = 0});

  dynamic getBool(String key, {bool def = false});

  void putString(String key, String value);

  void putInt(String key, int value);

  void putDouble(String key, double value);

  void putBool(String key, bool value);
}
