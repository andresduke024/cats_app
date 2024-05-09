import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/cat_details_repository.dart';
import '../get_cat_image_use_case.dart';

class GetCatImageUseCaseImpl implements GetCatImageUseCase {
  final CatDetailsRepository _repository;

  GetCatImageUseCaseImpl() : _repository = GetIt.I.get();

  @override
  Future<String> invoke({required Cat data}) async => await _repository.getImage(data: data);
}
