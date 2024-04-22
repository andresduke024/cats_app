sealed class HomeState {}

final class HomeStarted extends HomeState {}

final class HomeNavigation extends HomeState {
  final String route;

  HomeNavigation({required this.route});
}
