import 'package:flutter/material.dart';

abstract class RouteGenerator {
  const RouteGenerator();

  Route<dynamic>? generateRoute(RouteSettings settings);
}

abstract class ExtendedRouteGenerator implements RouteGenerator {
  List<Route<dynamic>> generateInitialRoute(String initialRoute);
}
