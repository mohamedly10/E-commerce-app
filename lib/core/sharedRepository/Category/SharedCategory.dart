import 'package:e_commerce_app/feature/Category/data/model/Category_model.dart';

class SharedCategories {
  // Private constructor
  SharedCategories._privateConstructor();

  // Singleton instance
  static final SharedCategories _instance = SharedCategories._privateConstructor();

  // Factory constructor to provide the instance
  factory SharedCategories() {
    return _instance;
  }



  List<Category>? _listCategory;
  List<Category>? get listCategory => _listCategory;

int? _index;
int? get index => _index;



  void saveCtegories(List<Category> allCategories) {
    _listCategory=allCategories;
  }
  void saveIndex(int index) {
    _index=index;
  }
}