import 'package:cats_app/utils/modules.dart';

sealed class HomeEvent {}

final class HomeModuleButtonTapped extends HomeEvent {
  final Module module;

  HomeModuleButtonTapped({required this.module});
}
