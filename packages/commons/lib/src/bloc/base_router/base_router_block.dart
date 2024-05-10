import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/common_routes.dart';
import '../router/router_bloc.dart';
import '../router/router_events.dart';
import '../router/router_state.dart';

class BaseRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CommonRoutes.values.map((e) => e.value).toList();

  BaseRouterBloc();

  @override
  void onPushRequested(PushRequest event, Emitter<RouterState> emit) {
    RouterPushStatus status = RouterPushStatus(
      type: RouterActionHandlerType.self,
      route: event.route,
      arguments: event.arguments,
      actionType: event.actionType,
    );

    emit(RouterState.push(status: status));
  }

  @override
  void onPopRequested(PopRequested event, Emitter<RouterState> emit) {
    final status = RouterPopStatus(
      type: RouterActionHandlerType.self,
      route: event.route ?? "",
    );

    emit(RouterState.pop(status: status));
  }
}