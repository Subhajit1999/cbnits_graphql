import 'package:cbnits_graphql/screens/error/ui/error_page.dart';
import 'package:cbnits_graphql/screens/main_page/ui/main_screen.dart';
import 'package:cbnits_graphql/screens/splash/ui/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Splash());
      case '/main':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage('', '', false, () {}));
    }
  }
}