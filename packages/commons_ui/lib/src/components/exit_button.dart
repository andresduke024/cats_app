import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final RouterActionHandlerType routerActionHandlerType;
  final Function(RouterEvent) onTap;

  const ExitButton({
    super.key,
    required this.routerActionHandlerType,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final event = PopRequest(type: routerActionHandlerType);
        onTap(event);
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
