import 'package:modular_router/modular_router.dart';

import '../../utils/cats_favorites_package_routes.dart';

class CatFavoritesRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CatsFavoritesPackageRoutes.values.map((e) => e.value).toList();

  CatFavoritesRouterBloc();
}
