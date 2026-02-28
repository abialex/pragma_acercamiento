import 'package:freezed_annotation/freezed_annotation.dart';

part 'cat_filter_model.freezed.dart';
part 'cat_filter_model.g.dart';

@freezed
abstract class CatFilterModel with _$CatFilterModel {
  const factory CatFilterModel({@JsonKey(name: 'q') String? search, int? limit, int? page}) = _CatFilterModel;

  factory CatFilterModel.fromJson(Map<String, dynamic> json) => _$CatFilterModelFromJson(json);
}
