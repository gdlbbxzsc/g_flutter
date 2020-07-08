abstract class ISpUtil {
  dynamic get(String key);

  void put(String key, dynamic value);

  //String
  void putString(String key, String value);

  String getString(String key, {String def});

  String getString0(String key, {String def = ""});

//int
  void putInt(String key, int value);

  int getInt(String key, {int def});

  int getInt0(String key, {int def = 0});

//double
  void putDouble(String key, double value);

  double getDouble(String key, {double def});

  double getDouble0(String key, {double def = 0});

  //bool
  void putBool(String key, bool value);

  bool getBool(String key, {bool def});

  bool getBool0(String key, {bool def = false});
}
