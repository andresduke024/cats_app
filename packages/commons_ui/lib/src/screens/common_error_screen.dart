import 'package:commons/commons.dart';
import 'package:commons_ui/src/utils/common_resources.dart';
import 'package:flutter/material.dart';

class CommonErrorScreen extends StatelessWidget {
  final Function(RouterEvent) onBackButtonPressed;
  final Widget? child;

  const CommonErrorScreen({super.key, required this.onBackButtonPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(CommonResources.error.value)),
            _buildExitButton(),
            child ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildExitButton() {
    return InkWell(
      onTap: () {
        final event = PopRequested(type: SimplePopRequest());
        onBackButtonPressed(event);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          child: Text(
            "Go back",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
