import 'package:commons/commons.dart';
import 'package:commons_ui/src/components/exit_button.dart';
import 'package:commons_ui/src/utils/common_resources.dart';
import 'package:flutter/material.dart';

import '../utils/navigation_point.dart';

class CommonErrorScreen extends StatelessWidget {
  final NavigationPoint navigationPoint;
  final Function(RouterEvent) onBackButtonPressed;
  final Widget? child;

  const CommonErrorScreen({
    super.key,
    required this.navigationPoint,
    required this.onBackButtonPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(CommonResources.error.value),
                  width: size.width,
                  fit: BoxFit.contain,
                ),
                ExitButton(
                  navigationPoint: navigationPoint,
                  onTap: onBackButtonPressed,
                ),
                child ?? const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
