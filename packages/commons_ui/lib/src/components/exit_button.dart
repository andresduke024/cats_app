import 'package:commons/commons.dart';
import 'package:commons_ui/src/utils/navigation_point.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final NavigationPoint navigationPoint;
  final Function(RouterEvent) onTap;

  const ExitButton({
    super.key,
    required this.navigationPoint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(navigationPoint.popRequest);
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
