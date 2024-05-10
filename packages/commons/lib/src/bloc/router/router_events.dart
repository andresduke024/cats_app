import 'package:commons/commons.dart';
import 'package:flutter/widgets.dart';

sealed class RouterEvent {
  const RouterEvent();
}

final class PushRequest extends RouterEvent {
  final String route;
  final Object? arguments;
  final RouterPushActionType actionType;
  final VoidCallback? onGoBack;

  const PushRequest({
    required this.route,
    this.arguments,
    this.actionType = const RouterPushRegularActionType(),
    this.onGoBack,
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
