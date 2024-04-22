import 'package:flutter/material.dart';

final class ModuleAppBar {
  final AppBar widget;

  const ModuleAppBar._({required this.widget});

  ModuleAppBar.build({
    required BuildContext context,
    required String title,
    required VoidCallback onPressBack,
  }) : this._(
          widget: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onPressBack,
            ),
            elevation: 0.1,
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
}
