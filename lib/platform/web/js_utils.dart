import 'dart:js' as js;

class JsUtils {
  static open(String url) {
    js.context.callMethod("open", [url]);
  }
}
