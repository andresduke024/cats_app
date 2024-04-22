class Cat {
  final String id;
  final String breedName;
  final String origin;
  final int affectionLevel;
  final int intelligence;
  final String imageUrl;
  final String description;
  final String adaptability;
  final String lifeSpan;

  const Cat({
    required this.id,
    required this.breedName,
    required this.origin,
    required this.affectionLevel,
    required this.intelligence,
    required this.imageUrl,
    required this.description,
    required this.adaptability,
    required this.lifeSpan,
  });

  Cat copyWith({
    String? id,
    String? breedName,
    String? origin,
    int? affectionLevel,
    int? intelligence,
    String? imageUrl,
    String? description,
    String? adaptability,
    String? lifeSpan,
  }) {
    return Cat(
      id: id ?? this.id,
      breedName: breedName ?? this.breedName,
      origin: origin ?? this.origin,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      intelligence: intelligence ?? this.intelligence,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      adaptability: adaptability ?? this.adaptability,
      lifeSpan: lifeSpan ?? this.lifeSpan,
    );
  }

  @override
  bool operator ==(covariant Cat other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.breedName == breedName &&
        other.origin == origin &&
        other.affectionLevel == affectionLevel &&
        other.intelligence == intelligence &&
        other.imageUrl == imageUrl &&
        other.description == description &&
        other.adaptability == adaptability &&
        other.lifeSpan == lifeSpan;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        breedName.hashCode ^
        origin.hashCode ^
        affectionLevel.hashCode ^
        intelligence.hashCode ^
        imageUrl.hashCode ^
        description.hashCode ^
        adaptability.hashCode ^
        lifeSpan.hashCode;
  }
}
