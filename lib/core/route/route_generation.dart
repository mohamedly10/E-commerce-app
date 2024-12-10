import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/page/Product_list.dart';
import 'package:e_commerce_app/feature/auth/presentation/pages/login.dart';
import 'package:e_commerce_app/feature/auth/presentation/pages/sign_up.dart';
import 'package:e_commerce_app/feature/home/presentiotion/page/home.dart';
import 'package:e_commerce_app/feature/splash/presentation/pages/splash_veiw.dart';
import 'package:flutter/material.dart';

import '../../feature/Acount/presentation/pages/Acount.dart';
import '../../feature/Favorites/presentiotion/page/Favorite.dart';
import '../../feature/Product/presentiotion/page/product_details.dart';
import '../../feature/home/presentiotion/page/Category.dart';
import '../Layout/layout_page.dart';

class  Routegenerator{
  static Route<dynamic>routegenerator(RouteSettings setting){
    switch (setting.name){
      case RouteName.SplashVeiw:
        return MaterialPageRoute(builder: (context)=> const SplashVeiw(),settings: setting);
      case RouteName.Sign_in:
        return MaterialPageRoute(builder: (context)=> const Sign_in(),settings: setting);
      case RouteName.Sign_Up:
        return MaterialPageRoute(builder: (context)=> const SignUp(),settings: setting);
      case RouteName.Home_page:
        return MaterialPageRoute(builder: (context)=> const Home_page(),settings: setting);
      case RouteName.Category_page:
        return MaterialPageRoute(builder: (context)=>   CategoryPage(),settings: setting);
      case RouteName.Favorite_page:
        return MaterialPageRoute(builder: (context)=>  const Favorite_page(),settings: setting);
      case RouteName.Acount_page:
        return MaterialPageRoute(builder: (context)=>  const Acount_page(),settings: setting);
      case RouteName.Layout_Page:
        return MaterialPageRoute(builder: (context)=>  const Layout_Page(),settings: setting);
      case RouteName.ProductList:
        return MaterialPageRoute(builder: (context)=> const ProductList(),settings: setting);
      case RouteName.ProductDetails:
        return MaterialPageRoute(builder: (context)=> const ProductDetails(),settings: setting);

      default:
        return MaterialPageRoute(builder: (context)=> const SplashVeiw(),settings: setting);


    }
  }
}