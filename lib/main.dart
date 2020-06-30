import 'package:flutter/material.dart';
import 'package:g_flutter/application.dart';
import 'package:g_flutter/pages/login/list_page.dart';
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
    print("build========");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginWidget(),
      routes: Routes.routes,
    );
  }
}
