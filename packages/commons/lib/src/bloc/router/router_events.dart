sealed class RouterEvent {
  const RouterEvent();
}

final class PushRequest extends RouterEvent {
  final String route;
  final Object? arguments;

  PushRequest({required this.route, this.arguments});
}

sealed class PopRequested extends RouterEvent {
  final String? route;

  const PopRequested({this.route});
}

final class SimplePopRequest extends PopRequested {
  const SimplePopRequest({super.route});
}

final class AppRootPopRequest extends PopRequested {
  const AppRootPopRequest({super.route});
}
