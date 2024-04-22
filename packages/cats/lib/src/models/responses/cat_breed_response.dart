// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'cat_weight_response.dart';

class CatBreedResponse {
  CatWeightResponse? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetStreetUrl;
  String? vcaHospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;

  CatBreedResponse({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetStreetUrl,
    this.vcaHospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  CatBreedResponse.fromMap(Map<String, dynamic> map) {
    weight = map['weight'] != null ? CatWeightResponse.fromJson(map['weight']) : null;
    id = map['id'];
    name = map['name'];
    cfaUrl = map['cfa_url'];
    vetStreetUrl = map['vetstreet_url'];
    vcaHospitalsUrl = map['vcahospitals_url'];
    temperament = map['temperament'];
    origin = map['origin'];
    countryCodes = map['country_codes'];
    countryCode = map['country_code'];
    description = map['description'];
    lifeSpan = map['life_span'];
    indoor = map['indoor'];
    lap = map['lap'];
    altNames = map['alt_names'];
    adaptability = map['adaptability'];
    affectionLevel = map['affection_level'];
    childFriendly = map['child_friendly'];
    dogFriendly = map['dog_friendly'];
    energyLevel = map['energy_level'];
    grooming = map['grooming'];
    healthIssues = map['health_issues'];
    intelligence = map['intelligence'];
    sheddingLevel = map['shedding_level'];
    socialNeeds = map['social_needs'];
    strangerFriendly = map['stranger_friendly'];
    vocalisation = map['vocalisation'];
    experimental = map['experimental'];
    hairless = map['hairless'];
    natural = map['natural'];
    rare = map['rare'];
    rex = map['rex'];
    suppressedTail = map['suppressed_tail'];
    shortLegs = map['short_legs'];
    wikipediaUrl = map['wikipedia_url'];
    hypoallergenic = map['hypoallergenic'];
    referenceImageId = map['reference_image_id'];
  }

  factory CatBreedResponse.fromJson(Map<String, dynamic> json) => CatBreedResponse.fromMap(json);
}
