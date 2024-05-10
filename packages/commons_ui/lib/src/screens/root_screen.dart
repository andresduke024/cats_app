import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:commons/commons.dart';

class RootScreen<Router extends RouterBloc> extends StatefulWidget {
  final Widget? child;
  final Function(BuildContext context)? onInitState;

  const RootScreen({
    super.key,
    this.child,
    this.onInitState,
  });

  @override
  State<StatefulWidget> createState() => _RootScreenState<Router>();
}

final class _RootScreenState<Router extends RouterBloc> extends State<RootScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.onInitState != null) {
      widget.onInitState!(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<Router, RouterState>(
      bloc: context.read(),
      listener: (listenerContext, state) {
        switch (state.status) {
          case InitialRouterStatus():
            break;
          case RouterPushStatus():
            _onPushState(context, state.status as RouterPushStatus);
          case RouterPopStatus():
            _onPopState(context, state.status as RouterPopStatus);
        }
      },
      child: widget.child ?? const SizedBox(),
    );
  }

  void _onPushState(BuildContext context, RouterPushStatus status) {
    switch (status.type) {
      case RouterActionHandlerType.self:
        _onPush(context, status);
      case RouterActionHandlerType.external:
        final event = PushRequest(route: status.route, arguments: status.arguments);
        context.read<BaseRouterBloc>().add(event);
    }
  }

  void _onPush(BuildContext context, RouterPushStatus status) {
    switch (status.actionType) {
      case RouterPushAndRemoveUntilActionType(removeUntilRoute: final removeUntilRoute):
        Navigator.pushNamedAndRemoveUntil(context, status.route, (route) => route.settings.name == removeUntilRoute);
      case RouterPushRegularActionType():
        Navigator.pushNamed(context, status.route, arguments: status.arguments);
    }
  }

  void _onPopState(BuildContext context, RouterPopStatus status) {
    switch (status.type) {
      case RouterActionHandlerType.self:
        _onPop(context, status.route);
      case RouterActionHandlerType.external:
        final event = PopRequest(route: status.route, type: RouterActionHandlerType.self);
        context.read<BaseRouterBloc>().add(event);
    }
  }

  void _onPop(BuildContext context, String route) {
    if (route.isEmpty) {
      Navigator.pop(context);
      return;
    }

    Navigator.popUntil(context, (navigator) => navigator.settings.name == route);
  }
}
