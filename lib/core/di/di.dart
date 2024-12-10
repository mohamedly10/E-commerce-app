import 'package:dio/dio.dart';
import '../../feature/home/data/data_sorce/data_source.dart';
import '../../feature/home/data/repository_imp/category_repository_imp.dart';
import '../../feature/home/domin/use_case/use_case.dart';

class ServiceLocator {
  late final Dio dio;
  late final CategoryDataSource categoryDataSource;
  late final CategoryRepositoryImpl categoryRepository;
  late final CategoryUseCase categoryUseCase;



  ServiceLocator() {
    dio = Dio();
    categoryDataSource = CategoryDataSource(dio: dio);
    categoryRepository = CategoryRepositoryImpl(categoryDataSource);
    categoryUseCase = CategoryUseCase(categoryRepository);
  }
}




