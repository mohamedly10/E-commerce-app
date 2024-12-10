
import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/home/data/data_sorce/data_source.dart';
import 'package:e_commerce_app/feature/home/data/repository_imp/category_repository_imp.dart';
import 'package:e_commerce_app/feature/home/domin/repository/category_reapository.dart';
import 'package:e_commerce_app/feature/home/presentiotion/manger/Sub%20Category/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/use_case/use_case.dart';

class SubCategoryCubit extends Cubit<SubCategoryState>{
 late CategoryDataSource categoryDataSource= CategoryDataSource(dio: Dio());
  late  CategoryRepositoryImpl categoryRepository=CategoryRepositoryImpl(categoryDataSource);
 late   SubCategoryUseCase subCategoryUseCase =SubCategoryUseCase(categoryRepository);

  SubCategoryCubit() : super(SubCategoryInitial());

  Future<void> fetchSubCategories(String categoryId) async {
    emit(SubCategoryLoading());
    try {
      final subCategories = await subCategoryUseCase.execute(categoryId);
      if (subCategories.isEmpty) {
        emit(SubCategoryFailure("empity"));
      } else {
        emit(SubCategorySuccess());
      }
    } catch (e) {
      emit(SubCategoryFailure('error:$e'));
    }
  }



}