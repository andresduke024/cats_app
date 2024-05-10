import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/common_routes.dart';
import '../router/router_action_handler_type.dart';
import '../router/router_bloc.dart';
import '../router/router_events.dart';
import '../router/router_state.dart';

class BaseRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CommonRoutes.values.map((e) => e.value).toList();

  BaseRouterBloc();

  @override
  void onPushRequested(PushRequest event, Emitter<RouterState> emit) {
    final status = mapPushEventToState(event, type: RouterActionHandlerType.self);

    emit(RouterState.push(status: status));
  }
}
