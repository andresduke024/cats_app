import '../models/cat.dart';
import '../models/cat_detail.dart';

abstract class GetCatDetailsUseCase {
  Future<CatDetail> invoke({required Cat data});
}
