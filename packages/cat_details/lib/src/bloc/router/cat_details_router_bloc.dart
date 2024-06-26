import 'package:modular_router/modular_router.dart';

import '../../utils/cat_details_package_routes.dart';

final class CatDetailsRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CatDetailsPackageRoutes.values.map((e) => e.value).toList();

  CatDetailsRouterBloc();
}
