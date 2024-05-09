import 'package:commons/commons.dart';

abstract class CatsRepository {
  Future<List<Cat>> getList();
}
