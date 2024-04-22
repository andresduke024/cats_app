sealed class RouterStatus {
  final String route;
  final Object? arguments;

  RouterStatus({required this.route, this.arguments});
}

final class InitialRouterStatus extends RouterStatus {
  InitialRouterStatus() : super(route: "");
}

// Push status

sealed class RouterPushStatus extends RouterStatus {
  RouterPushStatus({required super.route, super.arguments});
}

final class RouterSimplePushStatus extends RouterPushStatus {
  RouterSimplePushStatus({required super.route, super.arguments});
}

final class RouterAppPushStatus extends RouterPushStatus {
  RouterAppPushStatus({required super.route, super.arguments});
}

// Pop status

sealed class RouterPopStatus extends RouterStatus {
  RouterPopStatus({required super.route, super.arguments});
}

final class RouterSimplePopStatus extends RouterPopStatus {
  RouterSimplePopStatus({required super.route});
}

final class RouterAppPopStatus extends RouterPopStatus {
  RouterAppPopStatus() : super(route: "");
}

// State

final class RouterState {
  final RouterStatus status;

  RouterState._({required this.status});

  RouterState.initial() : this._(status: InitialRouterStatus());

  RouterState.push({
    required RouterPushStatus status,
  }) : this._(status: status);

  RouterState.pop({
    required RouterStatus status,
  }) : this._(status: status);
}
