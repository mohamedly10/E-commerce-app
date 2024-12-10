import 'package:flutter/material.dart';

class Favorite_page extends StatelessWidget {
  const Favorite_page({super.key});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(left: 10, bottom: 10, top: 20),
                      width: screenwidth * 0.80,
                      child: const TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'What do you Search For...',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: screenwidth * 0.10,
                      color: theme.primaryColor,
                    )
                  ],
                ),
                SizedBox(
                  width: screenwidth
                  ,height: screenheight,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                      itemCount: 10,
                      itemBuilder: (context,index){
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/image/imagepr.png'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Air jorden",
                                    style: theme.textTheme.titleMedium?.copyWith(
                                        color: theme.canvasColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  )),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.orange),
                                  ),
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "Black Color",
                                      style: theme.textTheme.titleMedium?.copyWith(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: theme.canvasColor),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "40 LYD",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                            color: theme.canvasColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      )),
                                  SizedBox(width: screenwidth * 0.03),
                                  FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "30 LYD",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            decorationColor: theme.canvasColor,
                                            color: theme.canvasColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11),
                                      ))
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Image.asset(
                                    'assets/image/icon/favorate_icon1.png',
                                    width: 50,
                                    height: 50,
                                  )),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: theme.primaryColor,
                                ),
                                child: Text(
                                  "add to cart",
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 14, fontWeight: FontWeight.w500),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                )
              ]),
        ),
      ),
    );
  }
}
