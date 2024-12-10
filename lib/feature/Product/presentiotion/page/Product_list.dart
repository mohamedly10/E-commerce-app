import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

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
                  width: screenwidth,
                  height: screenheight,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.7, // Adjust the ratio to fit your design
                    ),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RouteName.ProductDetails);
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(0, 65, 32, 0.3),
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Stack(children: [
                                  Image.asset(
                                    width: screenwidth,
                                    "assets/image/product.png",
                                    fit: BoxFit.fill,
                                  ),
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: theme.primaryColor,)))
                                ],),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    FittedBox(
                                      alignment: Alignment.topLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Air Jordan",
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          color: theme.canvasColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      alignment: Alignment.topLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Nike shoes flexible for workout",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          color: theme.canvasColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenwidth * 0.02),
                                    Row(
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "40 LYD",
                                            style: theme.textTheme.titleMedium?.copyWith(
                                              color: theme.canvasColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenwidth * 0.03),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "30 LYD",
                                            style: theme.textTheme.titleMedium?.copyWith(
                                              decoration: TextDecoration.lineThrough,
                                              decorationColor: theme.canvasColor,
                                              color: theme.canvasColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenheight * 0.02),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            "Review (4.9)⭐",
                                            style: theme.textTheme.titleMedium?.copyWith(
                                              color: theme.canvasColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenwidth * 0.03),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Icon(
                                            Icons.add_circle_outlined,
                                            color: theme.primaryColor,
                                            size: 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

