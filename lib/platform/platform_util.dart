import 'dart:io';

class PlatformUtil {
  static bool get isWeb => identical(0, 0.0);

  static bool get isAndroid => isWeb ? false : Platform.isAndroid;

  static bool get isIOS => isWeb ? false : Platform.isIOS;

  static bool get isMacOS => isWeb ? false : Platform.isMacOS;

  static bool get isWindows => isWeb ? false : Platform.isWindows;

  static bool get isFuchsia => isWeb ? false : Platform.isFuchsia;

  static bool get isLinux => isWeb ? false : Platform.isLinux;
}
