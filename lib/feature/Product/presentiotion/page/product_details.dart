import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Icon(Icons.search,
                color: theme.primaryColor, size: screenwidth * 0.08),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 5),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: screenwidth * 0.08,
                color: theme.primaryColor,
              ),
            )
          ],
          title: const Center(child: Text('Product Details'))),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/image/product.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "Nike Air jorden",
                    style: theme.textTheme.titleMedium?.copyWith(
                      decorationColor: theme.canvasColor,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "40 LYD",
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.canvasColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenheight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: const Color.fromRGBO(0, 65, 130, 0.3))),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "2,300 sold",
                          style: theme.textTheme.titleMedium?.copyWith(
                            decorationColor: theme.canvasColor,
                            color: theme.canvasColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenwidth * 0.04,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "⭐4.8 (7,500)",
                        style: theme.textTheme.titleMedium?.copyWith(
                          decorationColor: theme.canvasColor,
                          color: theme.canvasColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenwidth * 0.27,
                  height: screenheight * 0.045,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.remove_circle_outlined,
                        color: Colors.white,
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "4",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.add_circle_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FittedBox(
                    alignment: Alignment.topLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Description",
                      style: theme.textTheme.titleMedium?.copyWith(
                        decorationColor: theme.canvasColor,
                        color: theme.canvasColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.01),
                  Text(
                    maxLines: 2, //search how add read more
                    overflow: TextOverflow.ellipsis,
                    "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories......Read More ",
                    style: theme.textTheme.titleMedium?.copyWith(
                      decorationColor: theme.canvasColor,
                      color: theme.canvasColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: screenheight * 0.03),
                  FittedBox(
                    alignment: Alignment.topLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Size",
                      style: theme.textTheme.titleMedium?.copyWith(
                        decorationColor: theme.canvasColor,
                        color: theme.canvasColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.02),
                  SizedBox(
                    width: screenwidth,
                    height: 30,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: theme.primaryColor,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: FittedBox(
                                alignment: Alignment.topLeft,
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  (index + 10).toString(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    decorationColor: theme.canvasColor,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: screenheight * 0.03),
                  FittedBox(
                    alignment: Alignment.topLeft,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Color",
                      style: theme.textTheme.titleMedium?.copyWith(
                        decorationColor: theme.canvasColor,
                        color: theme.canvasColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: screenheight * 0.02),
                  SizedBox(
                    width: screenwidth,
                    height: 30,
                    child: ListView.builder(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: FittedBox(
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.scaleDown,
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: screenheight * 0.03),

                  // the price

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FittedBox(
                              alignment: Alignment.topLeft,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Total price",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: const Color.fromRGBO(6, 0, 79, 0.6),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            FittedBox(
                              alignment: Alignment.topLeft,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "50 LYD",
                                style: theme.textTheme.titleMedium?.copyWith(
                                  color: theme.canvasColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                       Expanded
                         (
                           flex: 2,
                           child: ListTile(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20), // Add rounded corners
                         ),
                        tileColor: theme.primaryColor,
                        leading: Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
                        title:     FittedBox(
                          alignment: Alignment.center,
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Add to Cart",
                            style: theme.textTheme.titleMedium?.copyWith(
                              decorationColor: theme.canvasColor,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
