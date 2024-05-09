import 'package:cat_details/src/repositories/cat_details_repository.dart';
import 'package:commons/commons.dart';
import 'package:dio/dio.dart';

import '../../models/responses/cat_image_response.dart';
import '../../utils/cat_details_endpoints.dart';

final class CatDetailsRepositoryImpl extends BaseRepository implements CatDetailsRepository {
  @override
  Future<String> getImage({required Cat data}) async {
    final path = "${CatDetailsEndpoints.imageById.value}/${data.imageId}";
    Response? response = await super.get(path: path);

    final json = response?.data as Map<String, dynamic>;
    final body = CatImageResponse.fromMap(json);

    return body.url ?? "";
  }
}
