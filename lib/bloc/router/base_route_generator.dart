import 'package:cat_details/cat_details.dart';
import 'package:cats/cats.dart';
import 'package:cats_app/ui/screens/splash_screen.dart';
import 'package:cats_favorites/cats_favorites.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/home_screen.dart';

final class BaseRouteGenerator implements ExtendedRouteGenerator {
  const BaseRouteGenerator();

  Route get _errorRoute {
    return MaterialPageRoute(
      builder: (context) => const GenericErrorScreen<BaseRouterBloc>(navigationPoint: NavigationPoint.stack),
    );
  }

  @override
  Route? generateRoute(RouteSettings settings) {
    final route = CommonRoutes.init(value: settings.name ?? "");

    switch (route) {
      case CommonRoutes.error:
        return _errorRoute;
      case CommonRoutes.splash:
        return _generateSplashRoute();
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

  Route? _generateSplashRoute() {
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }

  Route? _generateHomeRoute() {
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }

  Route? _generateCatListRoute() {
    return MaterialPageRoute(
      builder: (context) => const MainCatsScreen(),
    );
  }

  Route? _generateCatFavoritesRoute() {
    return MaterialPageRoute(
      builder: (context) => const MainCatFavoritesScreen(),
    );
  }

  Route? _generateCatDetailsRoute(RouteSettings settings) {
    final data = CommonUtils().safeCast<Cat>(data: settings.arguments);

    if (data == null) {
      return _errorRoute;
    }

    return MaterialPageRoute(
      builder: (context) => MainCatDetailsScreen(data: data),
    );
  }

  @override
  List<Route<dynamic>> generateInitialRoute(String initialRoute) {
    return [
      MaterialPageRoute(
        settings: RouteSettings(name: CommonRoutes.root),
        builder: (context) => RootScreen<BaseRouterBloc>(
          onInitState: (rootScreenContext) {
            final event = PushRequest(route: CommonRoutes.splash.value);
            rootScreenContext.read<BaseRouterBloc>().add(event);
          },
        ),
      ),
    ];
  }
}
