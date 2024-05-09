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
    RouterPushStatus status = RouterAppPushStatus(
      route: event.route,
      arguments: event.arguments,
    );

    if (routes.contains(event.route)) {
      status = RouterSimplePushStatus(
        route: event.route,
        arguments: event.arguments,
      );
    }

    emit(RouterState.push(status: status));
  }

  void onPopRequested(PopRequested event, Emitter<RouterState> emit) {
    RouterPopStatus status;

    final route = event.route ?? "";

    switch (event) {
      case SimplePopRequest():
        status = RouterSimplePopStatus(route: route);
      case AppRootPopRequest():
        status = RouterAppPopStatus(route: route);
    }

    emit(RouterState.pop(status: status));
  }
}
