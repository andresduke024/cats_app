import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

abstract class MainPackageScreen extends StatelessWidget {
  final Function(ExternalNavigationRequest) onRootActionRequested;

  const MainPackageScreen(
    this.onRootActionRequested, {
    super.key,
  });
}
