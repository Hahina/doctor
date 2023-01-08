import 'package:doctor/screen/calendar_screen.dart';
import 'package:doctor/screen/login_screen.dart';
import 'package:doctor/screen/preparat_screen.dart';
import 'package:doctor/screen/today_screen.dart';
import 'package:doctor/widgets/bottom_naigator_bar.dart';
import 'package:flutter/material.dart';




class Routes {
  static const home = "/";
  static const todayScreen = "/todayScreen";
  static const preparatScreen = "/preparatScreen";
  static const bottomBar = "/bottomScreen";
  
  static final system = <String, WidgetBuilder>{
    home: (_) => const LoginScreen(),
    todayScreen: (_) => TodayScreen(),
    preparatScreen: (_) => PreparatScreen(),
    bottomBar: (_) => BottomBar(),
  };
}