import 'package:flutter/material.dart';
import 'package:modular_router/modular_router.dart';

import '../../ui/screens/cats_list_screen.dart';
import '../../utils/cats_package_routes.dart';

final class CatsRouteGenerator implements RouteGenerator {
  static const String name = "CatsRouteGenerator";

  @override
  Route? generateRoute(RouteSettings settings) {
    final route = CatsPackageRoutes.init(route: settings.name ?? "");

    switch (route) {
      case CatsPackageRoutes.listScreen:
        return MaterialPageRoute(builder: (_) => const CatsListScreen());
      case CatsPackageRoutes.undefined:
        return null;
    }
  }
}
