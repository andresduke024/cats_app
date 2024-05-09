import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';

import '../../repositories/cats_favorites_repository.dart';

final class AddFavoriteCatUseCaseImpl implements AddFavoriteCatUseCase {
  final CatsFavoritesRepository _repository;

  AddFavoriteCatUseCaseImpl() : _repository = GetIt.I.get();

  @override
  Future invoke({required Cat cat}) async {
    await _repository.add(cat: cat);
  }
}
