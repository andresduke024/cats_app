import 'router_action_handler_type.dart';
import 'router_push_action_type.dart';

sealed class RouterStatus {
  final RouterActionHandlerType type;
  final String route;
  final Object? arguments;

  const RouterStatus({
    required this.type,
    required this.route,
    this.arguments,
  });
}

final class InitialRouterStatus extends RouterStatus {
  const InitialRouterStatus() : super(route: "", type: RouterActionHandlerType.external);
}

final class RouterPushStatus extends RouterStatus {
  final RouterPushActionType actionType;

  const RouterPushStatus({
    required super.type,
    required super.route,
    super.arguments,
    required this.actionType,
  });
}

final class RouterPopStatus extends RouterStatus {
  const RouterPopStatus({
    required super.type,
    required super.route,
    super.arguments,
  });
}

// State

final class RouterState {
  final RouterStatus status;

  RouterState._({required this.status});

  RouterState.initial() : this._(status: const InitialRouterStatus());

  RouterState.push({
    required RouterPushStatus status,
  }) : this._(status: status);

  RouterState.pop({
    required RouterStatus status,
  }) : this._(status: status);
}
