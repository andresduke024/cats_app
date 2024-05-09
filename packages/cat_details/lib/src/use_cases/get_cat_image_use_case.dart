import 'package:commons/commons.dart';

abstract class GetCatImageUseCase {
  Future<String> invoke({required Cat data});
}
