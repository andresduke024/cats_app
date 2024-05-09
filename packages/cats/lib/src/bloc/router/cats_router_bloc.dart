import 'package:commons/commons.dart';

import '../../utils/cats_package_routes.dart';

final class CatsRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CatsPackageRoutes.values.map((e) => e.value).toList();

  CatsRouterBloc();
}
