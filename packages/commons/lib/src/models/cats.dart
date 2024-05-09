import 'dart:convert';

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
        other.weightScale == weightScale &&
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
        weightScale.hashCode ^
        breedName.hashCode ^
        origin.hashCode ^
        affectionLevel.hashCode ^
        intelligence.hashCode ^
        imageId.hashCode ^
        description.hashCode ^
        adaptability.hashCode ^
        lifeSpan.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'weightScale': weightScale,
      'breedName': breedName,
      'origin': origin,
      'affectionLevel': affectionLevel,
      'intelligence': intelligence,
      'imageId': imageId,
      'description': description,
      'adaptability': adaptability,
      'lifeSpan': lifeSpan,
    };
  }

  factory Cat.fromMap(Map<String, dynamic> map) {
    return Cat(
      id: map['id'] as String,
      weightScale: map['weightScale'] as int,
      breedName: map['breedName'] as String,
      origin: map['origin'] as String,
      affectionLevel: map['affectionLevel'] as int,
      intelligence: map['intelligence'] as int,
      imageId: map['imageId'] as String,
      description: map['description'] as String,
      adaptability: map['adaptability'] as String,
      lifeSpan: map['lifeSpan'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cat.fromJson(String source) => Cat.fromMap(json.decode(source) as Map<String, dynamic>);
}
