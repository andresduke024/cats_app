import 'package:flutter/material.dart';

class NestedNavigator extends StatelessWidget {
  final Widget initialScreen;

  final RouteFactory? onGenerateRoute;

  const NestedNavigator({
    super.key,
    required this.initialScreen,
    this.onGenerateRoute,
  });

  GlobalKey<NavigatorState> _getNavigatorKey() {
    return GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _getNavigatorKey(),
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: (navigator, initialRoute) => [
        MaterialPageRoute(builder: (context) => initialScreen),
      ],
    );
  }
}
