import 'dart:js' as js;

import 'package:g_flutter/platform_utils/base/html/i_html_options.dart';

class HtmlUtilWebImpl extends IHtmlUtil {
  @override
  void openHtmlPage(String url) {
    js.context.callMethod("open", [url]);
  }
}
