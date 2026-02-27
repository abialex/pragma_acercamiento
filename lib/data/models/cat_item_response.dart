import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_item_response.freezed.dart';
part 'cat_item_response.g.dart';

@freezed
abstract class CatWeightResponse with _$CatWeightResponse {
  const factory CatWeightResponse({String? imperial, String? metric}) = _CatWeightResponse;

  factory CatWeightResponse.fromJson(Map<String, dynamic> json) => _$CatWeightResponseFromJson(json);
}

@freezed
abstract class CatItemResponse with _$CatItemResponse {
  const factory CatItemResponse({
    CatWeightResponse? weight,
    String? id,
    String? name,
    @JsonKey(name: 'breed_group') String? breedGroup,
    @JsonKey(name: 'cfa_url') String? cfaUrl,
    @JsonKey(name: 'vetstreet_url') String? vetstreetUrl,
    @JsonKey(name: 'vcahospitals_url') String? vcahospitalsUrl,
    String? temperament,
    String? origin,
    @JsonKey(name: 'country_codes') String? countryCodes,
    @JsonKey(name: 'country_code') String? countryCode,
    String? description,
    @JsonKey(name: 'life_span') String? lifeSpan,
    int? indoor,
    int? lap,
    @JsonKey(name: 'alt_names') String? altNames,
    int? adaptability,
    @JsonKey(name: 'affection_level') int? affectionLevel,
    @JsonKey(name: 'child_friendly') int? childFriendly,
    @JsonKey(name: 'dog_friendly') int? dogFriendly,
    @JsonKey(name: 'energy_level') int? energyLevel,
    int? grooming,
    @JsonKey(name: 'health_issues') int? healthIssues,
    int? intelligence,
    @JsonKey(name: 'shedding_level') int? sheddingLevel,
    @JsonKey(name: 'social_needs') int? socialNeeds,
    @JsonKey(name: 'stranger_friendly') int? strangerFriendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    @JsonKey(name: 'suppressed_tail') int? suppressedTail,
    @JsonKey(name: 'short_legs') int? shortLegs,
    @JsonKey(name: 'wikipedia_url') String? wikipediaUrl,
    int? hypoallergenic,
    @JsonKey(name: 'reference_image_id') String? referenceImageId,
  }) = _CatItemResponse;

  factory CatItemResponse.fromJson(Map<String, dynamic> json) => _$CatItemResponseFromJson(json);
}
