import 'package:commons/commons.dart';

class BaseRouterBloc extends RouterBloc {
  @override
  List<String> get routes => CommonRoutes.values.map((e) => e.value).toList();

  BaseRouterBloc();
}
