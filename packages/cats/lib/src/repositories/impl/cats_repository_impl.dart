import 'package:cats/src/base/cats_package_injector.dart';
import 'package:cats/src/models/responses/cat_breed_response.dart';

import '../../models/cat.dart';
import '../cats_repository.dart';
import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

class CatsRepositoryImpl implements CatsRepository {
  final EnvironmentValuesProvider _environmentProvider;
  final GetIt _injector;
  final Dio _dio;

  CatsRepositoryImpl()
      : _environmentProvider = GetIt.instance.get<EnvironmentValuesProvider>(),
        _injector = CatsPackageInjector.instance,
        _dio = Dio();

  @override
  Future<List<Cat>> get() async {
    final ResponseMapper<Cat, CatBreedResponse> mapper = _injector.get();

    final url = _environmentProvider.get("apiUrl");
    final apiKey = _environmentProvider.get("apiKey");

    final headers = {"authentication": apiKey};

    Response? response = await _dio.get(url, options: Options(headers: headers));

    Iterable? list = response.data as List;
    List<CatBreedResponse> data = list.map((e) => CatBreedResponse.fromJson(e)).toList();

    return data.map((e) => mapper.mapResponse(from: e)).toList();
  }
}
