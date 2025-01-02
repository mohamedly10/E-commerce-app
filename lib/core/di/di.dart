import 'package:dio/dio.dart';
import '../../feature/Category/data/data_sorce/data_source.dart';import '../../feature/Category/data/repository_imp/category_repository_imp.dart';
import '../../feature/Category/domin/use_case/use_case.dart';
class ServiceLocator {
  late final Dio dio;
  late final CategoryDataSource categoryDataSource;
  late final CategoryRepositoryImpl categoryRepository;
  late final CategoryUseCase categoryUseCase;
  late final SubCategoryUseCase subCategoryUseCase;




  ServiceLocator() {
    dio = Dio();
    categoryDataSource = CategoryDataSource(dio: dio);
    categoryRepository = CategoryRepositoryImpl(categoryDataSource);
    categoryUseCase = CategoryUseCase(categoryRepository);
  }
  subServiceLocator() {
    dio = Dio();
    categoryDataSource = CategoryDataSource(dio: dio);
    categoryRepository = CategoryRepositoryImpl(categoryDataSource);
    subCategoryUseCase =SubCategoryUseCase(categoryRepository) ;
  }
}




