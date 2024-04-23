import '../../base/cats_package_injector.dart';
import '../../repositories/cats_repository.dart';
import '../get_cat_details_use_case.dart';

import '../../models/cat.dart';
import '../../models/cat_detail.dart';

class GetCatDetailsUseCaseImpl implements GetCatDetailsUseCase {
  final CatsRepository _repository;

  GetCatDetailsUseCaseImpl() : _repository = CatsPackageInjector.instance.get();

  @override
  Future<CatDetail> invoke({required Cat data}) async => await _repository.getDetails(data: data);
}
