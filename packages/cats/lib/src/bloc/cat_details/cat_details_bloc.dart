import 'package:cats/src/base/cats_package_injector.dart';
import 'package:cats/src/bloc/cat_details/cat_details_event.dart';
import 'package:cats/src/bloc/cat_details/cat_details_state.dart';
import 'package:cats/src/use-cases/get_cat_details_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cat.dart';

class CatDetailsBloc extends Bloc<CatDetailsEvent, CatDetailsState> {
  final GetCatDetailsUseCase _getCatDetailsUseCase;

  CatDetailsBloc({required Cat cat})
      : _getCatDetailsUseCase = CatsPackageInjector.instance.get(),
        super(CatDetailsStarted(cat: cat)) {
    _setUpEventListeners();

    add(LoadCatDetailsEvent(cat: cat));
  }

  void _setUpEventListeners() {
    on<LoadCatDetailsEvent>(_onLoadCatDetailsEvent);
  }

  Future _onLoadCatDetailsEvent(
    LoadCatDetailsEvent event,
    Emitter<CatDetailsState> emit,
  ) async {
    try {
      final details = await _getCatDetailsUseCase.invoke(data: event.cat);

      final state = CatLoadedState(details: details);
      emit(state);
    } catch (e) {
      print(e);
    }
  }
}
