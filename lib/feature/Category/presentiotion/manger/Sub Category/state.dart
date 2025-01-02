import '../../../data/model/SubCategory_model.dart';
abstract class SubCategoryState{}
class SubCategoryInitial extends SubCategoryState{}
class SubCategoryLoading extends SubCategoryState{}
class SubCategorySuccess extends SubCategoryState{
 late List<SubCategory> subCategory;

 SubCategorySuccess({required this.subCategory});
}
class SubCategoryFailure extends SubCategoryState{
  final String message;
  SubCategoryFailure(this.message);
}
class SelectCategoryState extends SubCategoryState{
 late int index;
 SelectCategoryState(this.index);
}
class LoadCategory extends SubCategoryState{

}

