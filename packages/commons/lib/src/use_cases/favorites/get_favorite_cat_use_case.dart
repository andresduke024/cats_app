import 'package:commons/commons.dart';

abstract class GetFavoritesCatUseCase {
  Future<Cat?> invoke({required String id});
}
