import 'package:flutter/material.dart';
import 'package:g_flutter/pages/main_tab_page.dart';
import 'package:g_flutter/pages/welcome_guide_page.dart';

class Routes {
  static const String WELCOME_GUIDE_PAGE = "WelcomeGuidePage";
  static const String MAIN_TAB_PAGE = "MainTabPage";

  static final Map<String, WidgetBuilder> routes = {
    WELCOME_GUIDE_PAGE: (context) => WelcomeGuidePage(),
    MAIN_TAB_PAGE: (context) => MainTabPage(),

//    REALEASE_ORDINARY_MISSION: (context) {
//      int taskSubType = ModalRoute.of(context).settings.arguments;
//      return ReleaseOrdinaryMission(taskSubType: taskSubType);
//    },
  };

//  Navigator.pushReplacementNamed(context, LOGIN);
//  Navigator.popAndPushNamed(context, CHOOSE_MISSION);
//  Navigator.pushNamed(context, RouteUtils.MY_RECTASK_LIST_PAGE,
//  arguments: pos);
//  Navigator.pushNamed(context, RouteUtils.RANKING_LIST_PAGE);
//  Navigator.pop(context);

//  static void toWeekRankingListPage(BuildContext context, int state) {
//    Navigator.pushNamed(context, RouteUtils.WEEK_RANKING_LIST_PAGE,
//        arguments: state);
//  }
//
//
//  static void toVipPage(BuildContext context) {
//    Navigator.pushNamed(context, RouteUtils.VIP_PAGE);
//  }

//  static void pop(BuildContext context, {bool realColse = false}) {
//    if (Navigator.canPop(context) || realColse) {
//      Navigator.pop(context);
//    } else {
//      toMain(context, popSelf: true);
//    }
//  }
}
