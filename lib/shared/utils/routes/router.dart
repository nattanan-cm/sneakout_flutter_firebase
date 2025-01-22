import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakout_flutter_firebase/screens/detail.dart';
import 'package:sneakout_flutter_firebase/screens/home.dart';
import 'package:sneakout_flutter_firebase/screens/login.dart';
import 'package:sneakout_flutter_firebase/screens/address.dart';
import 'package:sneakout_flutter_firebase/screens/payment.dart';
import 'package:sneakout_flutter_firebase/screens/thankyou.dart';
import 'package:sneakout_flutter_firebase/screens/wishlist.dart';
import 'package:sneakout_flutter_firebase/shared/utils/extensions/colors.dart';

import 'route_name.dart';

class SNORouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SNORouteName.home:
        return _route(const HomePage(), settings);

      case SNORouteName.login:
        return _route(const LoginPage(), settings);

      case SNORouteName.detail:
        return _route(const DetailPage(), settings);

      case SNORouteName.address:
        return _route(const AddressPage(), settings);

      case SNORouteName.payment:
        return _route(const PaymentPage(), settings);

      case SNORouteName.thankyou:
        return _route(const ThankyouPage(), settings);

      case SNORouteName.wishlist:
        return _route(const WishlistPage(), settings);

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
      CupertinoPageRoute(builder: (context) => widget, settings: settings);
}
