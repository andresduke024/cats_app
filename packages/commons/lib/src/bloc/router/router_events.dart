sealed class RouterEvent {}

sealed class PushRequested extends RouterEvent {
  final String route;
  final Object? arguments;

  PushRequested({required this.route, this.arguments});
}

final class AppRootPushRequest extends PushRequested {
  AppRootPushRequest({required super.route, super.arguments});
}

final class SimplePushRequest extends PushRequested {
  SimplePushRequest({required super.route, super.arguments});
}

sealed class PopRequested extends RouterEvent {
  final String? route;

  PopRequested({this.route});
}

final class SimplePopRequest extends PopRequested {
  SimplePopRequest({super.route});
}

final class AppRootPopRequest extends PopRequested {
  AppRootPopRequest({super.route});
}
