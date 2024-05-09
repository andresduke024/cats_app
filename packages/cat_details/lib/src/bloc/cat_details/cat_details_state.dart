import '../../models/cat_detail.dart';

sealed class CatDetailsState {
  final CatDetail details;

  const CatDetailsState({required this.details});
}

final class CatDetailsStarted extends CatDetailsState {
  const CatDetailsStarted({required super.details});
}

final class CatLoadedState extends CatDetailsState {
  const CatLoadedState({required super.details});
}

final class CatDetailErrorState extends CatDetailsState {
  const CatDetailErrorState({required super.details});
}
