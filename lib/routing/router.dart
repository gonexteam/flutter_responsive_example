import 'package:flutter/material.dart';
import 'package:flutter_responsive/routing/router_names.dart';
import 'package:flutter_responsive/ui/about/about_page.dart';
import 'package:flutter_responsive/ui/auth/login/login_page.dart';
import 'package:flutter_responsive/ui/home/home_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(const HomePage(), settings);
    case aboutRoute:
      return _getPageRoute(const AboutPage(), settings);
    case loginRoute:
      return _getPageRoute(const LoginPage(), settings);
    default:
      return _getPageRoute(const HomePage(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;

  _FadeRoute({required this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
