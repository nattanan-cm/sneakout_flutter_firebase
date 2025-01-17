import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/screens/home.dart';
import 'package:sneakout_flutter_firebase/screens/login.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';

import 'route_name.dart';

class SNORouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SNORouteName.home:
        return _route(const HomePage(), settings);

      case SNORouteName.login:
        return _route(const LoginPage(), settings);

      default:
        return _route(
            Scaffold(
              backgroundColor: SNOColors.background,
              body: Center(
                  child: Text('No route defined for ${settings.name}',
                      style: const TextStyle(color: SNOColors.white))),
            ),
            settings);
    }
  }

  static Route<dynamic> _route(Widget widget, RouteSettings settings) =>
      MaterialPageRoute(builder: (context) => widget, settings: settings);
}
