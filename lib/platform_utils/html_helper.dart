import 'package:g_flutter/platform_utils/base/html/i_html_options.dart';
import 'package:g_flutter/platform_utils/platform_util.dart';
import 'package:g_flutter/platform_utils/web/html/html_utils.dart';

import 'mobile/html/html_utils.dart';

class HtmlHelper extends IHtmlUtil {
  factory HtmlHelper.getInstance() => _instance;
  static final HtmlHelper _instance = HtmlHelper._init();

  IHtmlUtil _iSpUtil;

  HtmlHelper._init() {
    if (PlatformUtil.isWeb) {
      _iSpUtil = new HtmlUtilWebImpl();
    } else {
      _iSpUtil = new HtmlUtilMobileImpl();
    }
  }

  @override
  void openHtmlPage(String url) {
    _iSpUtil.openHtmlPage(url);
  }
}
