enum SplashStatus {
  initial,
  success,
}

final class SplashState {
  final SplashStatus status;
  const SplashState({
    this.status = SplashStatus.initial,
  });
}
