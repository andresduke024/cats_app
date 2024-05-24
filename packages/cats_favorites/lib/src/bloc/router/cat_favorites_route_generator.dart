import 'package:flutter/material.dart';
import 'package:modular_router/modular_router.dart';

import '../../utils/cats_favorites_package_routes.dart';

final class CatFavoritesRouteGenerator implements RouteGenerator {
  static const String name = "CatFavoritesRouteGenerator";

  @override
  Route? generateRoute(RouteSettings settings) {
    final route = CatsFavoritesPackageRoutes.init(route: settings.name ?? "");

    switch (route) {
      case CatsFavoritesPackageRoutes.undefined:
        return null;
    }
  }
}
