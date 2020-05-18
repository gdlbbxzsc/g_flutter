镜像				 PUB_HOSTED_URL										FLUTTER_STORAGE_BASE_URL
清华TUNA协会	 https://mirrors.tuna.tsinghua.edu.cn/dart-pub	https://mirrors.tuna.tsinghua.edu.cn/flutter
CNNIC			 http://mirrors.cnnic.cn/dart-pub						http://mirrors.cnnic.cn/flutter
腾讯云开源镜像站 https://mirrors.cloud.tencent.com/dart-pub		https://mirrors.cloud.tencent.com/flutter
					 https://pub.flutter-io.cn								https://storage.flutter-io.cn
插件 https://pub.dev/flutter/packages git https://github.com/flutter 书 https://flutter.cn/docs https://book.flutterchina.club https://dart.dev/web
论坛 https://juejin.im/tag/Flutter https://segmentfault.com/t/flutter
闲鱼 https://www.yuque.com/xytech/flutter https://www.jianshu.com/u/cf5c0e4b1111 
——————————————————————————————————————
flutter pub global activate webdev  安装webdev
flutter pub global run webdev  运行webdev
flutter pub global run webdev serve 启动本地服务---> http://localhost:8080  

flutter pub global activate stagehand 安装创建web模板项目工具
flutter pub global run stagehand 运行查看
flutter pub global run stagehand flutter-web-preview     cd到对应文件夹下根据模板创建项目
———————————————————  
flutter config --enable-web 开启项目支持Flutter web
flutter create 项目名（小写）  
flutter create .  现有项目创建web文件夹等
flutter run -d chrome 在项目路径下运行项目
flutter build web 生成web
———————————————————
@SuppressLint("SetJavaScriptEnabled")//原生调用flutterwebjs方法
public void testJS() { webView.loadUrl("javascript:somename()");}
js.context['somename'] = afunction;//flutterweb定义方法

String str=js.context['justTest'].callMethod('hello', ["aaaa"]); //flutter web 调用android 原生
webView.addJavascriptInterface(this, "justTest");
@SuppressLint("JavascriptInterface")
    @JavascriptInterface
    public String hello(String str) { 
        return "hello"; }

js.context['afunname'] = (str){};//通过js调用flutter方法
js.context.callMethod("afunname", ["a_str_data"]);
———————————————————混合开发
//创建flutter module 与native同级
flutter create -t module flutter_module  
//原生 settings.gradle下添加代码
//HybridAndroid/settings.gradle
setBinding(new Binding([gradle: this]))
evaluate(new File(
        settingsDir.parentFile,
        'flutter_module/.android/include_flutter.groovy'
))
//app添加依赖和java8支持最低版本minSdkVersion 16
implementation project(':flutter')
compileOptions { 
        sourceCompatibility 1.8
        targetCompatibility 1.8
}
———————————————————flutter_boost
//flutter端
  flutter_boost:
    git:
      url: 'https://github.com/alibaba/flutter_boost.git'
      ref: '1.12.13'
//编译通过最好能生成apk
//native端 app build.gradle
	    implementation project(':flutter_boost')
//其他配置 AndroidManifest app router 等 
——————————————————————————————————————
Builder和StatefulBuilder 相当于 stateless stateful 的匿名方式 可以有效的缩小context范围。
Provider.of<ViewModel>(context, listen: false).run() 取数据不刷新 
——————————————————————————————————————
https://github.com/yang7229693/flutter-study/tree/master/post 控件解释
https://juejin.im/post/5e94e4d3f265da480836b943 挺不错
https://www.cnblogs.com/yangyxd/p/11685964.html  https://www.jianshu.com/p/ebacfefce46f 导图
https://blog.csdn.net/qq_28268507/article/details/104757530?fps=1&locationNum=2  https://www.jianshu.com/p/3dd00f9821b6 fish redux
https://www.cnblogs.com/webcabana/p/12149972.html provider解释
https://blog.csdn.net/u011272795/article/details/83010974  http://www.imooc.com/article/286318 FutureBuilder可以配合网络请求刷新界面
混合开发
https://juejin.im/post/5c419c07f265da616f703aa1 框架方案
https://www.cnblogs.com/LeeGof/p/10925672.html  https://www.jianshu.com/p/46b3de24f142  https://www.jianshu.com/p/7b6522e3e8f1 原生
https://blog.csdn.net/qq_19979101/article/details/103777979  https://blog.csdn.net/qq_19979101/article/details/103718307 阿里
flutter web 
https://blog.csdn.net/Tencent_TEG/article/details/104284782 概念
https://www.jianshu.com/p/d872181a7395  https://www.jianshu.com/p/2893f2b52eee  https://www.jianshu.com/p/fe98bf64cafd