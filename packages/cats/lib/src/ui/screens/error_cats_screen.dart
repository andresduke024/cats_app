import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorCatsScreen extends StatelessWidget {
  final VoidCallback? onBackButtonPressed;

  const ErrorCatsScreen({super.key, this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return CommonErrorScreen(
      onBackButtonPressed: (event) {
        if (onBackButtonPressed != null) {
          onBackButtonPressed!();
          return;
        }

        context.read<CatsRouterBloc>().add(event);
      },
    );
  }
}
