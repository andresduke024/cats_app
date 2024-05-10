import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_action_handler_type.dart';
import 'router_events.dart';
import 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  List<String> get routes => [];

  RouterBloc() : super(RouterState.initial()) {
    on<PushRequest>(onPushRequested);
    on<PopRequest>(onPopRequested);
  }

  void onPushRequested(PushRequest event, Emitter<RouterState> emit) {
    final type = routes.contains(event.route) ? RouterActionHandlerType.self : RouterActionHandlerType.external;

    final status = mapPushEventToState(event, type: type);

    emit(RouterState.push(status: status));
  }

  void onPopRequested(PopRequest event, Emitter<RouterState> emit) {
    final status = RouterPopStatus(type: event.type, route: event.route ?? "");

    emit(RouterState.pop(status: status));
  }

  RouterPushStatus mapPushEventToState(
    PushRequest event, {
    required RouterActionHandlerType type,
  }) {
    return RouterPushStatus(
      type: type,
      route: event.route,
      arguments: event.arguments,
      actionType: event.actionType,
      onGoBack: event.onGoBack,
    );
  }
}
