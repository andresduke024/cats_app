import 'package:cats/src/models/responses/cat_breed_response.dart';
import 'package:cats/src/utils/cats_endpoints.dart';

import '../cats_repository.dart';
import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

class CatsRepositoryImpl extends BaseRepository implements CatsRepository {
  CatsRepositoryImpl();

  @override
  Future<List<Cat>> getList() async {
    final ResponseMapper<Cat, CatBreedResponse> mapper = GetIt.I.get();

    Response? response = await super.get(path: CatsEndpoints.breeds.value);

    Iterable? list = response?.data as List;
    List<CatBreedResponse> data = list.map((e) => CatBreedResponse.fromJson(e)).toList();

    return data.map((e) => mapper.mapResponse(from: e)).toList();
  }
}
