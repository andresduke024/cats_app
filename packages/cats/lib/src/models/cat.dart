class Cat {
  final String id;
  final int weightScale;
  final String breedName;
  final String origin;
  final int affectionLevel;
  final int intelligence;
  final String imageId;
  final String description;
  final String adaptability;
  final String lifeSpan;

  const Cat({
    required this.id,
    required this.weightScale,
    required this.breedName,
    required this.origin,
    required this.affectionLevel,
    required this.intelligence,
    required this.imageId,
    required this.description,
    required this.adaptability,
    required this.lifeSpan,
  });

  Cat copyWith({
    String? id,
    int? weightScale,
    String? breedName,
    String? origin,
    int? affectionLevel,
    int? intelligence,
    String? imageId,
    String? description,
    String? adaptability,
    String? lifeSpan,
  }) {
    return Cat(
      id: id ?? this.id,
      weightScale: weightScale ?? this.weightScale,
      breedName: breedName ?? this.breedName,
      origin: origin ?? this.origin,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      intelligence: intelligence ?? this.intelligence,
      imageId: imageId ?? this.imageId,
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
        other.imageId == imageId &&
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
        imageId.hashCode ^
        description.hashCode ^
        adaptability.hashCode ^
        lifeSpan.hashCode;
  }
}
