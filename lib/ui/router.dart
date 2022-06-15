import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iwksensor/constants/route_name.dart';
import 'package:iwksensor/ui/views/home_view.dart';
import 'package:iwksensor/ui/views/login_view.dart';
import 'package:iwksensor/ui/views/qr_view.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name) {
    case homeViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: HomeView()
      );
    case loginViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: LoginView()
      );

    case qrViewRoute:
      return _pageRoute(
          routeName: settings.name,
          viewToShow: QRViewExample()
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
            ),
          ),
        ),
      );
  }
}

PageRoute _pageRoute({String? routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
      builder: (_) => viewToShow,
      settings: RouteSettings(
          name: routeName
      )
  );
}