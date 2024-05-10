sealed class RouterPushActionType {
  const RouterPushActionType();
}

final class RouterPushAndRemoveUntilActionType extends RouterPushActionType {
  final String removeUntilRoute;

  const RouterPushAndRemoveUntilActionType({required this.removeUntilRoute});
}

final class RouterPushRegularActionType extends RouterPushActionType {
  const RouterPushRegularActionType();
}
