import 'package:cat_details/cat_details.dart';
import 'package:cats/cats.dart';
import 'package:cats_favorites/cats_favorites.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/home_screen.dart';
import 'base_router_block.dart';

final class BaseRouteGenerator implements RouteGenerator {
  static const String name = "BaseRouteGenerator";

  Route get _errorRoute {
    return MaterialPageRoute(
        builder: (context) => const GenericErrorScreen<BaseRouterBloc>(navigationPoint: NavigationPoint.stack));
  }

  _onRootActionRequested(BuildContext context, ExternalNavigationRequest request) {
    final router = context.read<BaseRouterBloc>();

    switch (request) {
      case ExternalPushNavigationRequest(route: final route, arguments: final arguments):
        router.add(SimplePushRequest(route: route, arguments: arguments));
      case ExternalPopNavigationRequest(route: final route):
        router.add(SimplePopRequest(route: route));
    }
  }

  @override
  Route? generateRoute(RouteSettings settings) {
    final route = CommonRoutes.init(value: settings.name ?? "");

    switch (route) {
      case CommonRoutes.error:
        return _errorRoute;
      case CommonRoutes.home:
        return _generateHomeRoute();
      case CommonRoutes.catsPackage:
        return _generateCatListRoute();
      case CommonRoutes.favoriteCatsPackages:
        return _generateCatFavoritesRoute();
      case CommonRoutes.catDetailsPackage:
        return _generateCatDetailsRoute(settings);
      case CommonRoutes.adoptCatsPackage:
        return _errorRoute;
    }
  }

  Route? _generateCatListRoute() {
    return MaterialPageRoute(
      builder: (context) => MainCatsScreen(
        (request) => _onRootActionRequested(context, request),
      ),
    );
  }

  Route? _generateHomeRoute() {
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }

  Route? _generateCatFavoritesRoute() {
    return MaterialPageRoute(
      builder: (context) => MainCatFavoritesScreen(
        (request) => _onRootActionRequested(context, request),
      ),
    );
  }

  Route? _generateCatDetailsRoute(RouteSettings settings) {
    final data = CommonUtils().safeCast<Cat>(data: settings.arguments);

    if (data == null) {
      return _errorRoute;
    }

    return MaterialPageRoute(
      builder: (context) => MainCatDetailsScreen(
        (request) => _onRootActionRequested(context, request),
        data: data,
      ),
    );
  }
}
