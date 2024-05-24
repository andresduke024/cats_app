import 'package:modular_router/modular_router.dart';

import '../../utils/cats_package_routes.dart';

final class CatsRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CatsPackageRoutes.values.map((e) => e.value).toList();

  CatsRouterBloc();
}
