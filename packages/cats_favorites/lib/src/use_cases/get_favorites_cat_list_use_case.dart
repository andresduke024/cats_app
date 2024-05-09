import 'package:commons/commons.dart';

abstract class GetFavoritesCatListUseCase {
  Future<List<Cat>> invoke();
}
