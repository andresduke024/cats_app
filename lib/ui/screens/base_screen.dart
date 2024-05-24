import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modular_router/modular_router.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RootScreen<BaseRouterBloc>(
      onInitState: (rootScreenContext) {
        final event = PushRequest(route: CommonRoutes.splash.value);
        rootScreenContext.read<BaseRouterBloc>().add(event);
      },
    );
  }
}
