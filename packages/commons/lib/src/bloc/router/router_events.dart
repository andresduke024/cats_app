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

final class PopRequested extends RouterEvent {
  final PopRequest type;

  PopRequested({required this.type});
}

sealed class PopRequest {
  final String? route;

  PopRequest({this.route});
}

final class SimplePopRequest extends PopRequest {
  SimplePopRequest({super.route});
}

final class AppRootPopRequest extends PopRequest {
  AppRootPopRequest({super.route});
}
