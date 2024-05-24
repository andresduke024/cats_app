import 'package:commons_ui/src/components/exit_button.dart';
import 'package:commons_ui/src/components/generic_asset_image.dart';
import 'package:commons_ui/src/utils/common_resources.dart';
import 'package:flutter/material.dart';
import 'package:modular_router/modular_router.dart';

class CommonErrorScreen extends StatelessWidget {
  final RouterActionHandlerType routerActionHandlerType;
  final Function(RouterEvent) onBackButtonPressed;
  final Widget? child;

  const CommonErrorScreen({
    super.key,
    required this.routerActionHandlerType,
    required this.onBackButtonPressed,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
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
                GenericAssetImage(
                  resourceName: CommonResources.error.value,
                ),
                ExitButton(
                  onTap: () {
                    final event = PopRequest(type: routerActionHandlerType);
                    onBackButtonPressed(event);
                  },
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
