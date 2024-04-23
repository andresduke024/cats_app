import '../../models/cat.dart';

sealed class CatDetailsEvent {
  final Cat cat;

  const CatDetailsEvent({required this.cat});
}

final class LoadCatDetailsEvent extends CatDetailsEvent {
  const LoadCatDetailsEvent({required super.cat});
}
