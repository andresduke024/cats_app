import 'package:commons/commons.dart';

import '../../models/cat_detail.dart';

sealed class CatDetailsEvent {
  const CatDetailsEvent();
}

final class LoadCatDetailsEvent extends CatDetailsEvent {
  final Cat cat;

  const LoadCatDetailsEvent({
    required this.cat,
  });
}

final class ToggleFavoritesEvent extends CatDetailsEvent {
  final CatDetail data;

  const ToggleFavoritesEvent({
    required this.data,
  });
}
