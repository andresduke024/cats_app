import 'package:cats_favorites/src/bloc/cats_favorites/cats_favorites_bloc.dart';
import 'package:cats_favorites/src/bloc/router/cat_favorites_route_generator.dart';
import 'package:cats_favorites/src/ui/screens/cats_favorites_screen.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/router/cat_favorites_router_bloc.dart';

class MainCatFavoritesScreen extends MainPackageScreen {
  const MainCatFavoritesScreen(
    super.onRootActionRequested, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatFavoritesRouterBloc()),
        BlocProvider(create: (_) => CatsFavoritesBloc()),
      ],
      child: GenericMainScreen<CatFavoritesRouterBloc>(
        onRootActionRequested: onRootActionRequested,
        initialScreen: const CatsFavoritesScreen(),
        routeGenerator: CatFavoritesRouteGenerator.name,
      ),
    );
  }
}
