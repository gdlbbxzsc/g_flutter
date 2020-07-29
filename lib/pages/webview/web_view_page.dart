import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:g_flutter/widgets/common/app_bars.dart';

class WebViewPage extends StatefulWidget {
  final String title;
  final String url;

  const WebViewPage({Key key, this.title, this.url}) : super(key: key);

  const WebViewPage.copy({Key key})
      : this(key: key, title: "点击复制", url: "pages/clipboard.html");

  const WebViewPage.alipay({Key key})
      : this(key: key, title: "支付宝支付", url: "pages/alipay.html");

  const WebViewPage.wechatpay({Key key})
      : this(key: key, title: "微信支付", url: "pages/wechatpay.html");

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // ignore:undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webInWeb',
      (int viewId) => html.IFrameElement()
        ..style.border = 'none'
        ..src = widget.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.backBlack(widget.title),
      body: HtmlElementView(viewType: 'webInWeb'),
    );
  }
}
