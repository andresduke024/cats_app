import 'package:commons/commons.dart';

import '../../bloc/router/base_router_block.dart';

class BaseRootScreen extends RootScreen<BaseRouterBloc> {
  BaseRootScreen({super.key, required super.child}) : super(onRootActionRequested: (_) {});
}
