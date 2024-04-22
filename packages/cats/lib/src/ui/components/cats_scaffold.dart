import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/router/cats_router_bloc.dart';

final class CatsScaffold extends StatelessWidget {
  final Widget body;
  final VoidCallback? onBackPressed;

  const CatsScaffold({
    super.key,
    required this.body,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context).widget,
      body: body,
    );
  }

  ModuleAppBar _buildAppBar(BuildContext context) {
    return ModuleAppBar.build(
      context: context,
      title: "Cats",
      onPressBack: () {
        if (onBackPressed != null) {
          onBackPressed!();
          return;
        }

        final event = PopRequested(type: SimplePopRequest());
        context.read<CatsRouterBloc>().add(event);
      },
    );
  }
}
