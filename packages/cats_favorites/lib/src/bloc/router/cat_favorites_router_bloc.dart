import 'package:commons/commons.dart';

import '../../utils/cats_favorites_package_routes.dart';

class CatFavoritesRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CatsFavoritesPackageRoutes.values.map((e) => e.value).toList();

  CatFavoritesRouterBloc();
}
