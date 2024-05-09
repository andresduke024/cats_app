import '../../models/cat_detail.dart';
import '../../use_cases/get_cat_image_use_case.dart';
import 'cat_details_event.dart';
import 'cat_details_state.dart';
import 'package:commons/commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CatDetailsBloc extends Bloc<CatDetailsEvent, CatDetailsState> {
  final GetCatImageUseCase _getCatDetailsUseCase;
  final GetFavoritesCatUseCase _getFavoritesCatUseCase;
  final AddFavoriteCatUseCase _addFavoriteCatUseCase;
  final DeleteFavoriteCatUseCase _deleteFavoriteCatUseCase;

  CatDetailsBloc({required Cat cat})
      : _getCatDetailsUseCase = GetIt.I.get(),
        _getFavoritesCatUseCase = GetIt.I.get(),
        _addFavoriteCatUseCase = GetIt.I.get(),
        _deleteFavoriteCatUseCase = GetIt.I.get(),
        super(
          CatDetailsStarted(details: CatDetail(details: cat)),
        ) {
    _setUpEventListeners();

    add(LoadCatDetailsEvent(cat: cat));
  }

  void _setUpEventListeners() {
    on<LoadCatDetailsEvent>(_onLoadCatDetailsEvent);
    on<ToggleFavoritesEvent>(_onToggleFavoritesEvent);
  }

  Future _onLoadCatDetailsEvent(
    LoadCatDetailsEvent event,
    Emitter<CatDetailsState> emit,
  ) async {
    try {
      await _loadFavoritesInfo(event.cat, emit);

      await _loadImage(emit);
    } catch (_) {
      emit(CatDetailErrorState(
        details: CatDetail(details: event.cat),
      ));
    }
  }

  Future _loadFavoritesInfo(
    Cat data,
    Emitter<CatDetailsState> emit,
  ) async {
    final isFavorite = await _getFavoritesCatUseCase.invoke(id: data.id) != null;

    final details = CatDetail(
      details: data,
      isFavorite: isFavorite,
    );

    emit(CatLoadedState(details: details));
  }

  Future _loadImage(
    Emitter<CatDetailsState> emit,
  ) async {
    final data = state.details;
    final image = await _getCatDetailsUseCase.invoke(data: data.details);
    final result = data.copyWith(imageUrl: image);

    emit(CatLoadedState(details: result));
  }

  Future _onToggleFavoritesEvent(
    ToggleFavoritesEvent event,
    Emitter<CatDetailsState> emit,
  ) async {
    try {
      if (!event.data.isFavorite) {
        await _addToFavorites(event, emit);
      } else {
        await _deleteFromFavorites(event, emit);
      }
    } catch (_) {
      emit(CatDetailErrorState(details: event.data));
    }
  }

  Future _addToFavorites(
    ToggleFavoritesEvent event,
    Emitter<CatDetailsState> emit,
  ) async {
    await _addFavoriteCatUseCase.invoke(cat: event.data.details);
    final newDetails = event.data.copyWith(isFavorite: true);

    final state = CatLoadedState(details: newDetails);
    emit(state);
  }

  Future _deleteFromFavorites(
    ToggleFavoritesEvent event,
    Emitter<CatDetailsState> emit,
  ) async {
    await _deleteFavoriteCatUseCase.invoke(id: event.data.details.id);
    final newDetails = event.data.copyWith(isFavorite: false);

    final state = CatLoadedState(details: newDetails);
    emit(state);
  }
}
