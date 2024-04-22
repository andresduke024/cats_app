import 'package:cats_app/bloc/router/base_router_block.dart';
import 'package:commons_ui/commons_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseErrorScreen extends StatelessWidget {
  const BaseErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonErrorScreen(onBackButtonPressed: (event) {
      context.read<BaseRouterBloc>().add(event);
    });
  }
}
