import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:g_flutter/application.dart';
import 'package:g_flutter/route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Application>.value(
    value: Application(),
    child: MyApp(),
  ));

//  runApp(MultiProvider(
//    providers: [
//      ChangeNotifierProvider<Application>.value(value: Application()),
//    ],
//    child: MyApp(),
//  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'G_Flutter_Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //initialRoute 优先级高于 home
      // home: MainTabPageWidget(),
      initialRoute: Routes.MAIN_TAB_PAGEWIDGET,
      routes: Routes.routes,
      localizationsDelegates: [
        GlobalEasyRefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        Locale("zh", "CN"),
        Locale("en", ""),
      ],
    );
  }
}
