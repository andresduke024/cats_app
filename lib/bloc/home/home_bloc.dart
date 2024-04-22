import 'package:cats_app/bloc/home/home_events.dart';
import 'package:cats_app/bloc/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStarted()) {
    on<HomeModuleButtonTapped>(_onHomeModuleButtonTapped);
  }

  void _onHomeModuleButtonTapped(HomeModuleButtonTapped event, Emitter<HomeState> emit) {
    final state = HomeNavigation(route: event.module.route.value);
    emit(state);
  }
}
