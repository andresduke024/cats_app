import 'package:commons/commons.dart';

abstract class CatsFavoritesRepository {
  Future<Cat?> get({
    required String id,
  });

  Future<List<Cat>> getAll();

  Future add({required Cat cat});

  Future delete({required String id});
}
