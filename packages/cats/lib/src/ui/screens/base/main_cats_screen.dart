import 'package:cats/src/bloc/cat_details/cat_details_bloc.dart';
import 'package:cats/src/bloc/cats/cats_list_bloc.dart';
import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cats/src/models/cat.dart';
import 'package:cats/src/ui/screens/base/base_cat_screen.dart';
import 'package:cats/src/ui/screens/cat_details_screen.dart';
import 'package:cats/src/ui/screens/cats_list_screen.dart';
import 'package:cats/src/ui/screens/error_cats_screen.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';

import '../../../utils/cats_package_routes.dart';

class MainCatsScreen extends MainPackageScreen {
  const MainCatsScreen(
    super.onRootActionRequested, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CatsRouterBloc()),
        BlocProvider(create: (_) => CatsListsBloc()),
      ],
      child: Scaffold(
        body: NestedNavigator(
          initialScreen: BaseCatScreen(
            onRootActionRequested: onRootActionRequested,
            child: const CatsListScreen(),
          ),
          onGenerateRoute: (settings) {
            final route = CatsPackageRoutes.init(route: settings.name ?? "");

            final undefinedRoute = MaterialPageRoute(builder: (_) => const ErrorCatsScreen());

            switch (route) {
              case CatsPackageRoutes.listScreen:
                return MaterialPageRoute(builder: (_) => const CatsListScreen());
              case CatsPackageRoutes.detailScreen:
                final data = CommonUtils().safeCast<Cat>(data: settings.arguments);
                return data == null ? undefinedRoute : MaterialPageRoute(builder: (_) => CatDetailsScreen(cat: data));
              case CatsPackageRoutes.undefined:
                return undefinedRoute;
            }
          },
        ),
      ),
    );
  }
}
