import 'package:cats_favorites/src/repositories/cats_favorites_repository.dart';
import 'package:commons/commons.dart';
import 'package:get_it/get_it.dart';

final class DeleteFavoriteCatUseCaseImpl implements DeleteFavoriteCatUseCase {
  final CatsFavoritesRepository _repository;

  DeleteFavoriteCatUseCaseImpl() : _repository = GetIt.I.get();

  @override
  Future invoke({required String id}) async {
    await _repository.delete(id: id);
  }
}
