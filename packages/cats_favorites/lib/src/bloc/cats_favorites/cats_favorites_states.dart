import 'package:commons/commons.dart';

sealed class CatsFavoritesState {
  final List<Cat>? data;

  const CatsFavoritesState({this.data});
}

final class CatsFavoritesInitialState extends CatsFavoritesState {
  const CatsFavoritesInitialState({super.data});
}

final class CatsFavoritesLoadingState extends CatsFavoritesState {
  const CatsFavoritesLoadingState({super.data});
}

final class CatsFavoritesLoadedState extends CatsFavoritesState {
  const CatsFavoritesLoadedState({super.data});
}

final class CatsFavoritesFailureState extends CatsFavoritesState {
  const CatsFavoritesFailureState({super.data});
}

final class CatsFavoritesNavigationState extends CatsFavoritesState {
  final String route;
  final Object? arguments;

  const CatsFavoritesNavigationState({
    required this.route,
    required this.arguments,
    super.data,
  });
}
