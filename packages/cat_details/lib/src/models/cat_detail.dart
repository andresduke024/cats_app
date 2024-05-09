import 'package:commons/commons.dart';

class CatDetail {
  final Cat details;
  final String imageUrl;
  final bool isFavorite;

  const CatDetail({
    required this.details,
    this.imageUrl = "",
    this.isFavorite = false,
  });

  CatDetail copyWith({
    Cat? details,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return CatDetail(
      details: details ?? this.details,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(covariant CatDetail other) {
    if (identical(this, other)) return true;

    return other.details == details && other.imageUrl == imageUrl && other.isFavorite == isFavorite;
  }

  @override
  int get hashCode => details.hashCode ^ imageUrl.hashCode ^ isFavorite.hashCode;
}
