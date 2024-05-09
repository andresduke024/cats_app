import 'package:commons/commons.dart';

abstract class GetCatsUseCase {
  Future<List<Cat>> invoke();
}
