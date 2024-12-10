import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/feature/home/data/model/Category_model.dart';
import 'package:e_commerce_app/feature/home/domin/use_case/use_case.dart';
import 'package:e_commerce_app/feature/home/presentiotion/manger/Category/state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryUseCase categoryUseCase;

  CategoryCubit(this.categoryUseCase) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await categoryUseCase.execute();
      if (categories.isEmpty) {
        emit(CategoryFild("empity"));
      } else {
        emit(CategorySuccess(categories));
      }
    } catch (e) {
      emit(CategoryFild('error:$e'));
    }
  }
}
