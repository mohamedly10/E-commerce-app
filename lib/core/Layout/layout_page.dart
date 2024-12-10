import 'package:e_commerce_app/core/Layout/Custom_button.dart';
import 'package:e_commerce_app/core/constant/constan_app.dart';
import 'package:e_commerce_app/feature/Acount/presentation/pages/Acount.dart';
import 'package:e_commerce_app/feature/Favorites/presentiotion/page/Favorite.dart';
import 'package:e_commerce_app/feature/home/presentiotion/page/home.dart';
import 'package:flutter/material.dart';

import '../../feature/home/presentiotion/page/Category.dart';


class Layout_Page extends StatefulWidget {
  const Layout_Page ({super.key});

  @override
  State<Layout_Page> createState() => _Layout_PageState();
}

class _Layout_PageState extends State<Layout_Page> {
  int select_index=0;
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    List<Widget> allPage  =  [
      Home_page(),
      CategoryPage(),
      Favorite_page(),
      Acount_page()
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: allPage[select_index],
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
            bool isSelect = index==select_index;
            return Nav_button_bar(
is_select: isSelect,
onTap: (){
setState(() {
select_index=index;
});
},
index: index,
              icon_url_unselect: ConstantApp.nav_icon_unselect[index],
              icon_url_select: ConstantApp.nav_icon_select[index],
);
          })
        ,)
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