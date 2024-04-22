import 'package:flutter_bloc/flutter_bloc.dart';

import './splash_events.dart';
import './splash_states.dart';
import '../../di/main_dependencies_builder.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState(status: SplashStatus.initial)) {
    _setUpEventsListeners();
    add(SplashStarted());
  }

  void _setUpEventsListeners() {
    on<SplashStarted>(_onSplashStartInitialSetUpEvent);
  }

  Future _onSplashStartInitialSetUpEvent(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    final dependenciesBuilder = MainDependenciesBuilder();
    await dependenciesBuilder.start();

    await Future.delayed(const Duration(seconds: 1));

    emit(const SplashState(
      status: SplashStatus.success,
    ));
  }
}
