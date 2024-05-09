import 'package:cats/src/bloc/cats/cats_list_states.dart';
import 'package:cats/src/bloc/cats/cats_lists_events.dart';
import 'package:cats/src/use-cases/get_cats_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CatsListsBloc extends Bloc<CatsListEvent, CatsListState> {
  final GetCatsUseCase _getCatsUseCase;

  CatsListsBloc()
      : _getCatsUseCase = GetIt.I.get(),
        super(const CatsListState.initial()) {
    _setUpEventsListeners();
  }

  void _setUpEventsListeners() {
    on<LoadCatsEvent>((event, emit) async {
      await _onLoadCatsEvent(event: event, emit: emit);
    });

    add(const LoadCatsEvent());
  }

  Future _onLoadCatsEvent({
    required LoadCatsEvent event,
    required Emitter<CatsListState> emit,
  }) async {
    try {
      emit(const CatsListState.loading());
      final cats = await _getCatsUseCase.invoke();

      emit(CatsListState.success(cats));
    } catch (_) {
      emit(const CatsListState.error());
    }
  }
}
