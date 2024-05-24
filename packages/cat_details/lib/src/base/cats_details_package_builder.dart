import 'package:cat_details/src/repositories/cat_details_repository.dart';
import 'package:cat_details/src/repositories/impl/cat_details_repository_impl.dart';
import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';
import 'package:modular_router/modular_router.dart';

import '../bloc/router/cat_details_route_generator.dart';
import '../use_cases/get_cat_image_use_case.dart';
import '../use_cases/impl/get_cat_image_use_case_impl.dart';

final class CatDetailsPackageBuilder implements BasePackageBuilder {
  @override
  Future<void> setUp() async {
    final injector = GetIt.I;

    // Router
    injector.registerFactory<RouteGenerator>(() => CatDetailsRouteGenerator(),
        instanceName: CatDetailsRouteGenerator.name);

    // Repositories
    injector.registerFactory<CatDetailsRepository>(() => CatDetailsRepositoryImpl());

    // Use Cases
    injector.registerFactory<GetCatImageUseCase>(() => GetCatImageUseCaseImpl());
  }
}
