import 'package:e_commerce_app/core/Layout/custom_widget/Custom_button.dart';
import 'package:e_commerce_app/core/Layout/manger/cubit.dart';
import 'package:e_commerce_app/core/Layout/manger/state.dart';
import 'package:e_commerce_app/core/constant/constan_app.dart';
import 'package:e_commerce_app/feature/Acount/presentation/pages/Acount.dart';
import 'package:e_commerce_app/feature/Favorites/presentiotion/page/Favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/Category/presentiotion/page/Category.dart';
import '../../feature/Category/presentiotion/page/home.dart';


class Layout_Page extends StatelessWidget {
  const Layout_Page({super.key});
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    List<Widget> allPage  =  [
      Home_page(),
      CategoryPage(),
      Favorite_page(),
      Acount_page()
    ];

    int selectIndex = 0;

    return BlocProvider(
      create: (context)=>NavigationCubit(),
      child: BlocBuilder<NavigationCubit,NavigationState>(
        builder:(context,state){

          if (state is NavigationSwap) {
            selectIndex = state.currentIndex;
          }
          var cubit= (context).read<NavigationCubit>();
          return Scaffold(
            backgroundColor: Colors.white,
            body: allPage[selectIndex],
            bottomNavigationBar: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: screenheight * 0.07,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:
                  List.generate( ConstantApp.nav_icon_select.length,(index){
                    bool isSelect = index==selectIndex;
                    return Nav_button_bar(
                      is_select: isSelect,
                      onTap: (){
                        cubit.setIndex(index);
                      },
                      index: index,
                      icon_url_unselect: ConstantApp.nav_icon_unselect[index],
                      icon_url_select: ConstantApp.nav_icon_select[index],
                    );
                  })
                  ,)
            ),
          );
        } ,
      ),
    );



  }
}



// ListView.builder(
// physics: const NeverScrollableScrollPhysics(),
// scrollDirection: Axis.horizontal,
// itemCount: ConstantApp.nav_icon_select.length,
// itemBuilder: (_, index) {
// bool isSelect = index==select_index;
// return Nav_button_bar(
// is_select: isSelect,
// onTap: (){
// setState(() {
// select_index=index;
// });
// },
// index: index,
// icon_url_select: ConstantApp.nav_icon_select[index],
// );
// },
// ),