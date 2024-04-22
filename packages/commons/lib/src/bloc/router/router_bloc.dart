import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_events.dart';
import 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc({required String rootPath}) : super(RouterState.initial()) {
    on<PushRequested>(onPushRequested);
    on<PopRequested>(onPopRequested);
  }

  void onPushRequested(PushRequested event, Emitter<RouterState> emit) {
    RouterPushStatus status;

    switch (event) {
      case AppRootPushRequest(route: final route, arguments: final arguments):
        status = RouterAppPushStatus(route: route, arguments: arguments);
      case SimplePushRequest(route: final route, arguments: final arguments):
        status = RouterSimplePushStatus(route: route, arguments: arguments);
    }

    emit(RouterState.push(status: status));
  }

  void onPopRequested(PopRequested event, Emitter<RouterState> emit) {
    RouterPopStatus status;

    switch (event.type) {
      case SimplePopRequest(route: final route):
        status = RouterSimplePopStatus(route: route ?? "");
      case AppRootPopRequest():
        status = RouterAppPopStatus();
    }

    emit(RouterState.pop(status: status));
  }
}
