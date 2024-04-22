class CommonUtils {
  T? safeCast<T>({required Object? data}) {
    try {
      return data as T;
    } catch (_) {
      return null;
    }
  }
}
