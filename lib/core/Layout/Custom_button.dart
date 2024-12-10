import 'dart:ffi';

import 'package:flutter/material.dart';

class Nav_button_bar extends StatelessWidget {
  late int index;
  late String icon_url_unselect;
  late String icon_url_select;
  late VoidCallback onTap;
   bool is_select;
   Nav_button_bar({super.key,required this.index,required this.icon_url_unselect,required this.onTap,required this.is_select,required this.icon_url_select});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
       decoration: BoxDecoration(
           color: is_select ? Colors.white:
               Colors.transparent,
           borderRadius: BorderRadius.circular(50)),
      child: Image.asset( is_select? icon_url_select:icon_url_unselect,
        width: screenwidth * 0.09,
      ),
      ),
    );
  }
}
