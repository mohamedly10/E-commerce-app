
import '../../data/model/Category_model.dart';
import '../../data/model/SubCategory_model.dart';
import '../repository/category_reapository.dart';


class CategoryUseCase{
  CategoryRepository categoryRepository;
  CategoryUseCase(this.categoryRepository);

  Future<List<Category>>execute (){
   return categoryRepository.getCategories();
  }
}

class SubCategoryUseCase {
  CategoryRepository categoryRepository;

  SubCategoryUseCase(this.categoryRepository);

  Future<List<SubCategory>> execute(String categoryId) {
    return categoryRepository.getSubCategories(categoryId);
  }
}