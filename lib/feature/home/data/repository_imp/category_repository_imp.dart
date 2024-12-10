
import 'package:e_commerce_app/feature/home/domin/repository/category_reapository.dart';
import '../data_sorce/data_source.dart';
import '../model/Category_model.dart';
import '../model/SubCategory_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;
  CategoryRepositoryImpl(this.categoryDataSource);

  @override
  Future<List<Category>> getCategories() {
return categoryDataSource.getCategory();
  }
  @override
  Future<List<SubCategory>> getSubCategories(String categoryId)  {
    return categoryDataSource.getubCategory(categoryId);
  }
}