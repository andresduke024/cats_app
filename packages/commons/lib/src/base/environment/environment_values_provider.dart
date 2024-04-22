import 'environment_values.dart';
import '../../errors/environment_exception.dart';

class EnvironmentValuesProvider {
  final EnvironmentValues _environment;

  const EnvironmentValuesProvider({required EnvironmentValues environment}) : _environment = environment;

  String get(String key) {
    String result = _environment.data[key] ?? "";

    if (result.isEmpty) throw EnvironmentException();

    return result;
  }
}
