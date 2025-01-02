import '../../feature/Category/data/model/Category_model.dart';
class ConstantApp {
 static List<String> nav_icon_unselect=[
    'assets/image/icon/Nav_Bottom_bar/UnSelectHome.png',
        'assets/image/icon/Nav_Bottom_bar/UnSelectCategory.png',
        'assets/image/icon/Nav_Bottom_bar/UnSelectFavorite.png',
        'assets/image/icon/Nav_Bottom_bar/UnSelectAcount.png',
  ];
 static List<String> nav_icon_select=[
   'assets/image/icon/Nav_Bottom_bar/SelectHome.png',
   'assets/image/icon/Nav_Bottom_bar/SelectCategory.png',
   'assets/image/icon/Nav_Bottom_bar/SelectFavorite.png',
   'assets/image/icon/Nav_Bottom_bar/SelectAcount.png',
 ];
 static String domin ="https://ecommerce.routemisr.com/api/v1/";


 static late  List <Category> allCategory;
 static  int?  indextheCategory;
}