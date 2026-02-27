import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/cat_breed.dart';

part 'cat_list_state.freezed.dart';

@freezed
abstract class CatListState with _$CatListState {
  const factory CatListState({@Default(false) bool isLoading, @Default([]) List<CatBreed> catsList, @Default(false) bool isFavoritesMode}) =
      _CatListState;
}
