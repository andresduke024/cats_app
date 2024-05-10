import 'package:commons/commons.dart';

sealed class RouterEvent {
  const RouterEvent();
}

final class PushRequest extends RouterEvent {
  final String route;
  final Object? arguments;
  final RouterPushActionType actionType;

  const PushRequest({
    required this.route,
    this.arguments,
    this.actionType = const RouterPushRegularActionType(),
  });
}

final class PopRequest extends RouterEvent {
  final String? route;
  final RouterActionHandlerType type;

  const PopRequest({
    this.route,
    required this.type,
  });
}
