import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../commons_ui.dart';

final class GenericScaffold<Router extends RouterBloc> extends StatelessWidget {
  final NavigationPoint origin;
  final String title;
  final Widget body;
  final VoidCallback? onBackPressed;

  const GenericScaffold({
    super.key,
    this.origin = NavigationPoint.stack,
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

        final event = origin == NavigationPoint.root ? const AppRootPopRequest() : const SimplePopRequest();
        context.read<Router>().add(event);
      },
    );
  }
}
