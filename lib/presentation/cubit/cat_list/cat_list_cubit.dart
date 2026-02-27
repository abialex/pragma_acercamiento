import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cat_filter_model.dart';
import '../../../domain/repositories/cat_repository.dart';
import 'cat_list_state.dart';

class CatListCubit extends Cubit<CatListState> {
  final CatRepository _repository;

  CatListCubit(this._repository) : super(const CatListState());

  Future<void> getList({CatFilterModel? filter}) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    try {
      final isFirstPage = (filter?.page ?? 0) == 0;

      final newCats = await _repository.getBreeds(filter: filter);

      emit(state.copyWith(isLoading: false, catsList: isFirstPage ? newCats : [...state.catsList, ...newCats]));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      // Podrías manejar el estado de error de otra forma si lo requieres
    }
  }
}
