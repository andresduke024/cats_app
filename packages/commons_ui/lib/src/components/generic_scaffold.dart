import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modular_router/modular_router.dart';

import '../../commons_ui.dart';

final class GenericScaffold<Router extends RouterBloc> extends StatelessWidget {
  final RouterActionHandlerType routerActionHandlerTypeOnBack;
  final String title;
  final Widget body;
  final VoidCallback? onBackPressed;

  const GenericScaffold({
    super.key,
    this.routerActionHandlerTypeOnBack = RouterActionHandlerType.self,
    required this.title,
    required this.body,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context).widget,
      body: SafeArea(
        child: body,
      ),
    );
  }

  ModuleAppBar _buildAppBar(BuildContext context) {
    return ModuleAppBar.build(
      context: context,
      title: title,
      onPressBack: () {
        if (onBackPressed != null) {
          onBackPressed!();
          return;
        }

        final event = PopRequest(type: routerActionHandlerTypeOnBack);
        context.read<Router>().add(event);
      },
    );
  }
}
