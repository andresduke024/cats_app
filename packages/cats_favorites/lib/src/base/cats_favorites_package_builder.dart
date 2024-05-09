import 'package:cats_favorites/src/bloc/router/cat_favorites_route_generator.dart';
import 'package:cats_favorites/src/repositories/cats_favorites_repository.dart';
import 'package:cats_favorites/src/repositories/impl/cats_favorites_repository_impl.dart';
import 'package:cats_favorites/src/use_cases/get_favorites_cat_list_use_case.dart';
import 'package:cats_favorites/src/use_cases/impl/add_favorite_cat_use_case_impl.dart';
import 'package:cats_favorites/src/use_cases/impl/delete_favorite_cat_use_case_impl.dart';
import 'package:cats_favorites/src/use_cases/impl/get_favorite_cat_use_case_impl.dart';
import 'package:cats_favorites/src/use_cases/impl/get_favorites_cat_list_use_case_impl.dart';
import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';

class CatsFavoritesPackageBuilder implements BasePackageBuilder {
  @override
  Future<void> setUp() async {
    final injector = GetIt.I;

    // Router
    injector.registerFactory<RouteGenerator>(() => CatFavoritesRouteGenerator(),
        instanceName: CatFavoritesRouteGenerator.name);

    // Repositories
    injector.registerFactory<CatsFavoritesRepository>(() => CatsFavoritesRepositoryImpl());
    injector.registerFactory<GetFavoritesCatListUseCase>(() => GetFavoritesCatListUseCaseImpl());

    // Use Cases
    injector.registerFactory<GetFavoritesCatUseCase>(() => GetFavoritesCatsUseCaseImpl());
    injector.registerFactory<AddFavoriteCatUseCase>(() => AddFavoriteCatUseCaseImpl());
    injector.registerFactory<DeleteFavoriteCatUseCase>(() => DeleteFavoriteCatUseCaseImpl());
  }
}
