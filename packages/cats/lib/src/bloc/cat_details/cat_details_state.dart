import '../../models/cat.dart';
import '../../models/cat_detail.dart';

sealed class CatDetailsState {
  const CatDetailsState();
}

final class CatDetailsStarted extends CatDetailsState {
  final Cat cat;

  const CatDetailsStarted({required this.cat});
}

final class CatLoadedState extends CatDetailsState {
  final CatDetail details;

  const CatLoadedState({required this.details});
}
