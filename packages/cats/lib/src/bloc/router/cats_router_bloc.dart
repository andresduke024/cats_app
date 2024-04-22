import 'package:cats/src/utils/cats_package_routes.dart';
import 'package:commons/commons.dart';

final class CatsRouterBloc extends RouterBloc {
  CatsRouterBloc() : super(rootPath: CatsPackageRoutes.listScreen.value);
}
