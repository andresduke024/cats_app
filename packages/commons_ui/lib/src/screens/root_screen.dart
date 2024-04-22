import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:commons/commons.dart';

class RootScreen<T extends RouterBloc> extends StatelessWidget {
  final Function(ExternalNavigationRequest) _onRootActionRequested;
  final Widget _child;

  const RootScreen({
    super.key,
    required Function(ExternalNavigationRequest) onRootActionRequested,
    required child,
  })  : _onRootActionRequested = onRootActionRequested,
        _child = child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<T, RouterState>(
      bloc: context.read(),
      listener: (listenerContext, state) {
        switch (state.status) {
          case InitialRouterStatus():
            break;
          case RouterSimplePushStatus(route: final route, arguments: final arguments):
            Navigator.pushNamed(context, route, arguments: arguments);
          case RouterSimplePopStatus(route: final route):
            _onPop(context, route);
          case RouterAppPushStatus(route: final route, arguments: final arguments):
            final request = ExternalPushNavigationRequest(route: route, arguments: arguments);
            _onRootActionRequested(request);
          case RouterAppPopStatus(route: final route):
            final request = ExternalPopNavigationRequest(route: route);
            _onRootActionRequested(request);
        }
      },
      child: _child,
    );
  }

  void _onPop(BuildContext context, String route) {
    if (route.isEmpty) {
      Navigator.pop(context);
      return;
    }

    Navigator.popUntil(context, (navigator) => navigator.settings.name == route);
  }
}
