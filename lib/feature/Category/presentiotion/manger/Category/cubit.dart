import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/constan_app.dart';
import 'package:e_commerce_app/feature/Category/domin/repository/category_reapository.dart';
import 'package:e_commerce_app/feature/Category/presentiotion/manger/Category/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/sharedRepository/Category/SharedCategory.dart';
import '../../../data/data_sorce/data_source.dart';
import '../../../data/model/Category_model.dart';
import '../../../data/repository_imp/category_repository_imp.dart';
import '../../../domin/use_case/use_case.dart';

class CategoryCubit extends Cubit<CategoryState> {


  late CategoryDataSource categoryDataSource = CategoryDataSource(dio: Dio());
  late CategoryRepositoryImpl categoryRepository= CategoryRepositoryImpl(categoryDataSource);
  late CategoryUseCase categoryUseCase=CategoryUseCase(categoryRepository);

  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of(context);
  int? categoryIndex;
  List<Category> categories = [];

  Future<void> fetchCategories() async {
    if (categories.isNotEmpty) return;
    emit(CategoryLoading());
    try {
      final fetchedCategories = await categoryUseCase.execute();
      if (fetchedCategories.isEmpty) {
        emit(CategoryFild("لا توجد فئات متاحة"));
      } else {
        ConstantApp.allCategory=fetchedCategories;
        categories = fetchedCategories;
        emit(CategorySuccess(categories));
      }
    } catch (e) {
      emit(CategoryFild('حدث خطأ أثناء جلب البيانات: $e'));
    }
  }



}
