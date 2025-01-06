import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo ({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Image.asset(

      "assets/image/route_icon.png",
     // height: screenHeight * 0.1,
      width: screenWidth * 0.15,
      fit: BoxFit.contain,
      alignment: Alignment.centerLeft,
    );
  }
}
