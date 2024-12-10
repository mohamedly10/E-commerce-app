import 'package:e_commerce_app/feature/Acount/presentation/widget/Text_Fild_Acount.dart';
import 'package:flutter/material.dart';

class Acount_page extends StatelessWidget {
  const Acount_page({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: screenheight * 0.09),
                Image.asset("assets/image/route_icon.png",
                    height: screenheight * 0.03,
                    width: screenwidth * 0.03,
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft),
                SizedBox(height: screenheight * 0.02),
                Text(
                  'Welcome ,mohamed',
                  style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: theme.canvasColor),
                ),
                Text(
                  'Welcome ,mohamed',
                  style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color.fromRGBO(6, 0, 79, 0.6)),
                ),
                TextFildAcount(title: "Your full name",),
                TextFildAcount(title: "Your  email",),
                TextFildAcount(title: "Your full password",),
                TextFildAcount(title: "Your phonenumber",),
                TextFildAcount(title: "Your Adress",),
              ]),
        ),
      ),
    );
  }
}
