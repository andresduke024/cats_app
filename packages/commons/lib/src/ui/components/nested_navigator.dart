import 'package:flutter/material.dart';

class NestedNavigator extends StatelessWidget {
  final _nestedNavigatorKey = GlobalKey<NavigatorState>();

  final Widget initialScreen;

  final Route<dynamic> Function(RouteSettings settings) onGenerateRoute;

  NestedNavigator({
    super.key,
    required this.initialScreen,
    required this.onGenerateRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _nestedNavigatorKey,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: (navigator, initialRoute) => [
        MaterialPageRoute(builder: (context) => initialScreen),
      ],
    );
  }
}
