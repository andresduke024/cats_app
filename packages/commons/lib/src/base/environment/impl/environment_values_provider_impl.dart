import '../../../errors/environment_exception.dart';
import '../environment_keys.dart';
import '../environment_values.dart';
import '../environment_values_provider.dart';

class EnvironmentValuesProviderImpl extends EnvironmentValuesProvider {
  final EnvironmentValues _environment;

  const EnvironmentValuesProviderImpl({
    required EnvironmentValues environment,
  }) : _environment = environment;

  @override
  String get(EnvironmentKeys key) {
    String result = _environment.data[key.value] ?? "";

    if (result.isEmpty) throw EnvironmentException();

    return result;
  }
}
