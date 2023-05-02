import 'package:flutter/material.dart';

import '../../features/home/presentation/screens/home_page.dart';
import '../../features/auth/login/presentation/login_page.dart';
import '../../features/splash/presentation/screens/splash_page.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => const LoginPage(),
    splash: (context) => const SplashPage(),
  };
}
