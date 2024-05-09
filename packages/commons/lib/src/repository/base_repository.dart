import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../base/environment/environment_keys.dart';
import '../base/environment/environment_values_provider.dart';

class BaseRepository {
  final EnvironmentValuesProvider _environmentProvider;
  final Dio _dio;

  BaseRepository()
      : _environmentProvider = GetIt.I.get<EnvironmentValuesProvider>(),
        _dio = Dio();

  Map<String, dynamic> _buildHeaders() {
    final apiKey = _environmentProvider.get(EnvironmentKeys.apiKey);

    return {"authentication": apiKey};
  }

  Future<Response?> get({required String path}) async {
    final baseUrl = _environmentProvider.get(EnvironmentKeys.api);
    final url = "$baseUrl$path";
    final headers = _buildHeaders();

    return await _dio.get(url, options: Options(headers: headers));
  }
}
