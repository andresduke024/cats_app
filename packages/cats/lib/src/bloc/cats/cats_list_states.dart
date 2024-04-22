import '../../models/cat.dart';

enum CatsListStatus {
  initial,
  loading,
  success,
  failure,
}

final class CatsListState {
  final List<Cat> data;
  final CatsListStatus status;

  const CatsListState._({
    this.data = const [],
    this.status = CatsListStatus.initial,
  });

  const CatsListState.initial() : this._();

  const CatsListState.loading() : this._(status: CatsListStatus.loading);

  const CatsListState.success(List<Cat> data) : this._(data: data, status: CatsListStatus.success);

  const CatsListState.error() : this._(status: CatsListStatus.failure);
}
