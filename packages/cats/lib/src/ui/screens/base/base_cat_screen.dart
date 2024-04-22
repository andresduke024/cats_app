import 'package:cats/src/bloc/router/cats_router_bloc.dart';
import 'package:commons_ui/commons_ui.dart';

class BaseCatScreen extends RootScreen<CatsRouterBloc> {
  const BaseCatScreen({
    super.key,
    required super.onRootActionRequested,
    required super.child,
  });
}
