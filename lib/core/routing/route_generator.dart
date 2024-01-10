import 'package:base_app/presentation/modules/auth/auth_types/auth_screen.dart';
import 'package:base_app/presentation/modules/intro/intro/intro_screen.dart';
import 'package:base_app/presentation/modules/intro/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/modules/auth/login/login_screen.dart';
import '../../presentation/modules/auth/register/register_screen.dart';
import '../../presentation/modules/layout/layout_screen.dart';
import 'platform_page_route.dart';
import 'routes.dart';
import 'undefined_route_screen.dart';


class RouteBaseGenerator {
  static Route generateRoute(RouteSettings settings) {
    Map? arguments = settings.arguments as Map<String, dynamic>?;

    switch (settings.name) {
      ///Intro
      case Routes.splashScreen:return platformPageRoute(const SplashScreen());
      case Routes.introScreen:return platformPageRoute(const IntroScreen());


      ///Auth
      case Routes.loginScreen:return platformPageRoute(const LoginScreen());
      case Routes.registerScreen:return platformPageRoute(const CustomerRegisterScreen());

      ///Layout
      case Routes.authScreen:return platformPageRoute(const AuthScreen());
      case Routes.layoutScreen:return platformPageRoute( CustomerLayoutScreen(currentPage: arguments?['currentPage']));

      default:return platformPageRoute(const UndefinedRouteScreen());
    }
  }


}
