import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/cats_repository.dart';
import '../get_cats_use_case.dart';

class GetCatsUseCaseImpl implements GetCatsUseCase {
  final CatsRepository _repository;

  GetCatsUseCaseImpl() : _repository = GetIt.I.get();

  @override
  Future<List<Cat>> invoke() async => await _repository.getList();
}
