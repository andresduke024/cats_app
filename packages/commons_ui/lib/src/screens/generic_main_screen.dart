import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../commons_ui.dart';

class GenericMainScreen<Router extends RouterBloc> extends StatelessWidget {
  final Widget initialScreen;

  final RouteGenerator routeGenerator;

  GenericMainScreen({
    super.key,
    required this.initialScreen,
    required String routeGenerator,
  }) : routeGenerator = GetIt.I.get(instanceName: routeGenerator);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedNavigator(
        initialScreen: RootScreen<Router>(
          child: initialScreen,
        ),
        onGenerateRoute: (settings) {
          final undefinedRoute = MaterialPageRoute(
            builder: (_) => GenericErrorScreen<Router>(
              navigationPoint: NavigationPoint.root,
            ),
          );

          return routeGenerator.generateRoute(settings) ?? undefinedRoute;
        },
      ),
    );
  }
}
