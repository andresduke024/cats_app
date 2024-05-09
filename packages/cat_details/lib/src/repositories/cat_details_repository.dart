import 'package:commons/commons.dart';

abstract class CatDetailsRepository {
  Future<String> getImage({required Cat data});
}
