import '../models/cat.dart';

abstract class GetCatsUseCase {
  Future<List<Cat>> get();
}
