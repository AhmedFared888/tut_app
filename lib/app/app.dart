import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/routes_manager.dart';
import 'package:tut_app/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //named construtor
  MyApp._internal();
  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory constructor

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: RoutesManager.splashRoute,
      theme: getAppTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
