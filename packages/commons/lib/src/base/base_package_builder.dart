import 'package:get_it/get_it.dart';

abstract class BasePackageBuilder {
  Future<void> setUp({GetIt? globalInjector});
}
