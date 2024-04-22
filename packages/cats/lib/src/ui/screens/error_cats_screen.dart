import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:commons/commons.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorCatsScreen extends StatelessWidget {
  const ErrorCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonErrorScreen(
      onBackButtonPressed: (event) {
        context.read<CatsRouterBloc>().add(event);
      },
    );
  }
}
