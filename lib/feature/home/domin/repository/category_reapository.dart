import '../../data/model/Category_model.dart';
import '../../data/model/SubCategory_model.dart';
abstract class CategoryRepository {
  Future<List<Category>> getCategories();
  Future<List<SubCategory>> getSubCategories(String categoryId);
}
