sealed class ExternalNavigationRequest {}

final class ExternalPopNavigationRequest extends ExternalNavigationRequest {}

final class ExternalPushNavigationRequest extends ExternalNavigationRequest {
  final String route;
  final Object? arguments;

  ExternalPushNavigationRequest({required this.route, this.arguments});
}
