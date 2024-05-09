import 'package:flutter/material.dart';

abstract class RouteGenerator {
  Route<dynamic>? generateRoute(RouteSettings settings);
}
