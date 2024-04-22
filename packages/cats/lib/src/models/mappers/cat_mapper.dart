import 'package:commons/commons.dart';
import 'package:cats/src/models/cat.dart';
import 'package:cats/src/models/responses/cat_breed_response.dart';

class CatMapper implements ResponseMapper<Cat, CatBreedResponse> {
  @override
  Cat mapResponse({required CatBreedResponse from}) => Cat(
        id: from.id ?? "",
        breedName: from.name ?? "",
        origin: from.origin ?? "",
        affectionLevel: from.affectionLevel ?? 0,
        intelligence: from.intelligence ?? 0,
        imageUrl: "",
        description: from.description ?? "",
        adaptability: from.adaptability?.toString() ?? "",
        lifeSpan: from.lifeSpan ?? "",
      );
}
