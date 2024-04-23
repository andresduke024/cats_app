import 'package:cats/src/base/cats_package_injector.dart';

import '../../models/cat.dart';
import '../../repositories/cats_repository.dart';
import '../get_cats_use_case.dart';

class GetCatsUseCaseImpl implements GetCatsUseCase {
  final CatsRepository _repository;

  GetCatsUseCaseImpl() : _repository = CatsPackageInjector.instance.get();

  @override
  Future<List<Cat>> invoke() async => await _repository.getList();
}
