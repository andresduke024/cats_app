import 'package:commons/commons.dart';

enum NavigationPoint {
  root,
  stack;
}

extension NavigationPointExtension on NavigationPoint {
  PopRequested get popRequest {
    switch (this) {
      case NavigationPoint.root:
        return const AppRootPopRequest();
      case NavigationPoint.stack:
        return const SimplePopRequest();
    }
  }
}
