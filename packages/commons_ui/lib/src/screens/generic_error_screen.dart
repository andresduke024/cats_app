import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/navigation_point.dart';
import 'common_error_screen.dart';

class GenericErrorScreen<T extends RouterBloc> extends StatelessWidget {
  final NavigationPoint navigationPoint;
  final VoidCallback? onBackButtonPressed;

  const GenericErrorScreen({
    super.key,
    required this.navigationPoint,
    this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CommonErrorScreen(
      navigationPoint: navigationPoint,
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
