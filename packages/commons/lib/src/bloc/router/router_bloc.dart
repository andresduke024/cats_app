import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_events.dart';
import 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  List<String> get routes => [];

  RouterBloc() : super(RouterState.initial()) {
    on<PushRequest>(onPushRequested);
    on<PopRequested>(onPopRequested);
  }

  void onPushRequested(PushRequest event, Emitter<RouterState> emit) {
    final type = routes.contains(event.route) ? RouterActionHandlerType.self : RouterActionHandlerType.external;

    RouterPushStatus status = RouterPushStatus(
      type: type,
      route: event.route,
      arguments: event.arguments,
      actionType: event.actionType,
    );

    emit(RouterState.push(status: status));
  }

  void onPopRequested(PopRequested event, Emitter<RouterState> emit) {
    RouterPopStatus status;

    final route = event.route ?? "";

    switch (event) {
      case SimplePopRequest():
        status = RouterPopStatus(type: RouterActionHandlerType.self, route: route);
      case AppRootPopRequest():
        status = RouterPopStatus(type: RouterActionHandlerType.external, route: route);
    }

    emit(RouterState.pop(status: status));
  }
}
