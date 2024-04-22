import '../models/cat.dart';

abstract class CatsRepository {
  Future<List<Cat>> get();
}
