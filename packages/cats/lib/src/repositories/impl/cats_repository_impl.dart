import 'dart:convert';

import 'package:cats/src/base/cats_package_injector.dart';
import 'package:cats/src/models/responses/cat_breed_response.dart';
import 'package:cats/src/utils/cats_endpoints.dart';

import '../../models/cat.dart';
import '../../models/cat_detail.dart';
import '../../models/responses/cat_image_response.dart';
import '../cats_repository.dart';
import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

class CatsRepositoryImpl extends BaseRepository implements CatsRepository {
  final GetIt _injector;

  CatsRepositoryImpl() : _injector = CatsPackageInjector.instance;

  @override
  Future<List<Cat>> getList() async {
    final ResponseMapper<Cat, CatBreedResponse> mapper = _injector.get();

    Response? response = await super.get(path: CatsEndpoints.breeds.value);

    Iterable? list = response?.data as List;
    List<CatBreedResponse> data = list.map((e) => CatBreedResponse.fromJson(e)).toList();

    return data.map((e) => mapper.mapResponse(from: e)).toList();
  }

  @override
  Future<CatDetail> getDetails({required Cat data}) async {
    final path = "${CatsEndpoints.imageById.value}/${data.imageId}";
    Response? response = await super.get(path: path);

    final json = response?.data as Map<String, dynamic>;
    final body = CatImageResponse.fromMap(json);

    final details = CatDetail(details: data, imageUrl: body.url ?? "");
    return details;
  }
}
