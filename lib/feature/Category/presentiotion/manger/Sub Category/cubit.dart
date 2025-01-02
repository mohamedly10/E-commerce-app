
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/constant/constan_app.dart';
import 'package:e_commerce_app/feature/Category/presentiotion/manger/Sub%20Category/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/sharedRepository/Category/SharedCategory.dart';
import '../../../data/data_sorce/data_source.dart';
import '../../../data/model/Category_model.dart';
import '../../../data/model/SubCategory_model.dart';
import '../../../data/repository_imp/category_repository_imp.dart';
import '../../../domin/use_case/use_case.dart';
class SubCategoryCubit extends Cubit<SubCategoryState>{
  late SharedCategories sharedCategories;
 late CategoryDataSource categoryDataSource= CategoryDataSource(dio: Dio());
  late  CategoryRepositoryImpl categoryRepository=CategoryRepositoryImpl(categoryDataSource);
 late   SubCategoryUseCase subCategoryUseCase =SubCategoryUseCase(categoryRepository);

  SubCategoryCubit() : super(SubCategoryInitial());


 static SubCategoryCubit get(context) => BlocProvider.of(context);

  String? categorySlelct="";
 int indextheCategory =ConstantApp.indextheCategory??0;

  Future<void> fetchSubCategories(String categoryId) async {
    late  List<SubCategory> subCategories;

    emit(SubCategoryLoading());
    try {
       subCategories = await subCategoryUseCase.execute(categoryId);
      if (subCategories.isEmpty) {
        emit(SubCategorySuccess(subCategory: subCategories));
      } else {

        emit(SubCategorySuccess(subCategory: subCategories));
      }
    } catch (e) {
      emit(SubCategoryFailure('error:$e'));
    }
  }
 selectCategory(int index){
   emit(SelectCategoryState(index));
 }





}