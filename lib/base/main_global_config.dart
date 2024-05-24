import 'package:commons/commons.dart';
import 'package:modular_router/modular_router.dart';

final class MainGlobalConfig implements ModularRouterGlobalConfig {
  @override
  List<String> get baseRoutes => CommonRoutes.values.map((item) => item.value).toList();
}
