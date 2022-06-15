import 'package:iwksensor/locator.dart';
import 'package:iwksensor/services/navigation_service.dart';
import 'package:iwksensor/ui/router.dart';
import 'package:iwksensor/ui/views/startup_view.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ENVIROMENTAL SENSOR',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: StartUpView(),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      onGenerateRoute: generateRoute,
    );
  }
}
