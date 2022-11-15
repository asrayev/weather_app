import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/homepage.dart';

class RouteName{
  static const splash_page="splash";
  static const register="register";
  static const login="login";
  static const home="home";
  static const blog="blog";
}

class AppRoutes{
  static Route generateRoutes(RouteSettings settings){
    var args=settings.arguments;
    switch(settings.name){
      // case RouteName.splash_page: return MaterialPageRoute(builder: (_)=>SplashPage());
      case RouteName.home: return MaterialPageRoute(builder: (_)=>HomePage());
      // case RouteName.login: return MaterialPageRoute(builder: (_)=>LoginPage());
      // case RouteName.blog: return MaterialPageRoute(builder: (_)=>BlogPage());
      default: return MaterialPageRoute(builder: (_)=>Scaffold());
    }
  }
}