import '../models/cat.dart';
import '../models/cat_detail.dart';

abstract class CatsRepository {
  Future<List<Cat>> getList();

  Future<CatDetail> getDetails({required Cat data});
}
