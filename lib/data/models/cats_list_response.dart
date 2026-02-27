import 'package:freezed_annotation/freezed_annotation.dart';
import 'cat_item_response.dart';

part 'cats_list_response.freezed.dart';

@freezed
abstract class CatsListResponse with _$CatsListResponse {
  const CatsListResponse._();
  const factory CatsListResponse({@Default([]) List<CatItemResponse> data}) = _CatsListResponse;

  factory CatsListResponse.fromJson(List<dynamic> json) {
    return CatsListResponse(data: json.map((e) => CatItemResponse.fromJson(e as Map<String, dynamic>)).toList());
  }
}
