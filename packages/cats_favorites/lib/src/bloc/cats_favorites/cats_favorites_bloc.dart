import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import './cats_favorites_events.dart';
import './cats_favorites_states.dart';
import '../../use_cases/get_favorites_cat_list_use_case.dart';

final class CatsFavoritesBloc extends Bloc<CatsFavoritesEvent, CatsFavoritesState> {
  final GetFavoritesCatListUseCase _getFavoritesCatListUseCase;
  final DeleteFavoriteCatUseCase _deleteFavoriteCatUseCase;

  CatsFavoritesBloc()
      : _getFavoritesCatListUseCase = GetIt.I.get(),
        _deleteFavoriteCatUseCase = GetIt.I.get(),
        super(const CatsFavoritesInitialState()) {
    _setUpEventListeners();
    add(const LoadCatsFavorites());
  }

  void _setUpEventListeners() {
    on<LoadCatsFavorites>(_onLoadCatsFavoritesEvent);
    on<DeleteFavoriteCat>(_onDeleteFavoriteCatEvent);
    on<AdoptFavoriteCat>(_onAdoptFavoriteCat);
    on<NavigateToDetails>(_onNavigateToDetails);
  }

  Future _onLoadCatsFavoritesEvent(
    LoadCatsFavorites event,
    Emitter<CatsFavoritesState> emit,
  ) async {
    emit(const CatsFavoritesLoadingState());

    try {
      final result = await _getFavoritesCatListUseCase.invoke();

      emit(CatsFavoritesLoadedState(data: result));
    } catch (_) {
      emit(const CatsFavoritesFailureState());
    }
  }

  Future _onDeleteFavoriteCatEvent(
    DeleteFavoriteCat event,
    Emitter<CatsFavoritesState> emit,
  ) async {
    try {
      await _deleteFavoriteCatUseCase.invoke(id: event.data.id);

      final list = state.data?.toList();
      list?.removeWhere((element) => element.id == event.data.id);

      emit(CatsFavoritesLoadedState(data: list));
    } catch (_) {
      emit(const CatsFavoritesFailureState());
    }
  }

  Future _onAdoptFavoriteCat(
    AdoptFavoriteCat event,
    Emitter<CatsFavoritesState> emit,
  ) async {
    try {} catch (_) {
      emit(const CatsFavoritesFailureState());
    }
  }

  Future _onNavigateToDetails(
    NavigateToDetails event,
    Emitter<CatsFavoritesState> emit,
  ) async {
    final newState = CatsFavoritesNavigationState(
      route: CommonRoutes.catDetailsPackage.value,
      arguments: event.data,
      data: state.data,
    );

    emit(newState);
  }
}
