

import '../../../data/model/Category_model.dart';

abstract class CategoryState {}
class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}
class CategorySuccess extends CategoryState {
   List<Category> categories;
  CategorySuccess(this.categories);
}
class CategoryFild extends CategoryState {
  String message;
  CategoryFild(this.message);
}





