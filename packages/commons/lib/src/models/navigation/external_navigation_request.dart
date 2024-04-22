sealed class ExternalNavigationRequest {
  final String route;

  ExternalNavigationRequest({required this.route});
}

final class ExternalPopNavigationRequest extends ExternalNavigationRequest {
  ExternalPopNavigationRequest({required super.route});
}

final class ExternalPushNavigationRequest extends ExternalNavigationRequest {
  final Object? arguments;

  ExternalPushNavigationRequest({required super.route, this.arguments});
}
