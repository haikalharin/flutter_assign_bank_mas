import 'package:flutter/material.dart';
import 'package:flutter_assigment_bank_mas/core/router/routes.dart';
import 'package:flutter_assigment_bank_mas/screens/landing_page/landing_page.dart';
import 'package:flutter_assigment_bank_mas/screens/webview_page/webview_page.dart';

import '../../utils/remote_utils.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landingPage:
        return MaterialPageRoute(builder: (_) => const LandingPage());
      case Routes.webViewPage:
        return MaterialPageRoute(
            builder: (_) => WebViewPage(
              url: getUrl(settings.arguments),
              title: getTitle(settings.arguments),
            ));
           default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> _getCombinedRoutes() => {};

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}
