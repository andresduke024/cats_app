import '../bloc/router/cats_route_generator.dart';
import '../models/mappers/cat_mapper.dart';
import '../models/responses/cat_breed_response.dart';
import '../use-cases/get_cats_use_case.dart';
import '../use-cases/impl/get_cats_use_case_impl.dart';
import '../repositories/cats_repository.dart';
import '../repositories/impl/cats_repository_impl.dart';

import 'package:get_it/get_it.dart';
import 'package:commons/commons.dart';

class CatsPackageBuilder implements BasePackageBuilder {
  @override
  Future<void> setUp() async {
    final injector = GetIt.I;

    // Router
    injector.registerFactory<RouteGenerator>(() => CatsRouteGenerator(), instanceName: CatsRouteGenerator.name);

    // Mappers
    injector.registerFactory<ResponseMapper<Cat, CatBreedResponse>>(() => CatMapper());

    // Repositories
    injector.registerFactory<CatsRepository>(() => CatsRepositoryImpl());

    // Use Cases
    injector.registerFactory<GetCatsUseCase>(() => GetCatsUseCaseImpl());
  }
}
