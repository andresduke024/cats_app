import 'package:commons/commons.dart';
import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';

import '../cats_favorites_repository.dart';

final class CatsFavoritesRepositoryImpl implements CatsFavoritesRepository {
  final EnvironmentValuesProvider _environmentProvider;

  CatsFavoritesRepositoryImpl() : _environmentProvider = GetIt.I.get();

  Future<Box<String>> _start() async {
    final key = _environmentProvider.get(EnvironmentKeys.favoritesLocalDB);

    if (key.isEmpty) throw EnvironmentException();

    await Hive.openBox<String>(key);

    return Hive.box(key);
  }

  @override
  Future<Cat?> get({
    required String id,
  }) async {
    final box = await _start();
    final element = box.get(id);

    if (element == null) return null;

    return Cat.fromJson(element);
  }

  @override
  Future<List<Cat>> getAll() async {
    final box = await _start();

    return box.values.map((e) => Cat.fromJson(e)).toList();
  }

  @override
  Future add({required Cat cat}) async {
    final box = await _start();

    await box.put(cat.id, cat.toJson());
  }

  @override
  Future delete({required String id}) async {
    final box = await _start();

    box.delete(id);
  }
}
