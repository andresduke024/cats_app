import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common_error_screen.dart';

class GenericErrorScreen<T extends RouterBloc> extends StatelessWidget {
  final RouterActionHandlerType routerActionHandlerType;
  final VoidCallback? onBackButtonPressed;

  const GenericErrorScreen({
    super.key,
    required this.routerActionHandlerType,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CommonErrorScreen(
      routerActionHandlerType: routerActionHandlerType,
      onBackButtonPressed: (event) {
        if (onBackButtonPressed != null) {
          onBackButtonPressed!();
          return;
        }

        context.read<T>().add(event);
      },
    );
  }
}
