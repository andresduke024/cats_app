import 'environment_keys.dart';

abstract class EnvironmentValuesProvider {
  const EnvironmentValuesProvider();

  String get(EnvironmentKeys key);
}
