import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/productDetails/cubit.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/productDetails/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    final String productId = ModalRoute.of(context)!.settings.arguments as String;

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
      body: BlocProvider(
        create: (context)=>ProductDetailsCubit()..feetchProdutDetails(productId),
        child: BlocBuilder<ProductDetailsCubit,ProductDetailsState>(

          builder: (context,state){
            if(state is ProductDetailsLoading){
              return const Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            }
            else if(state is ProductDetailsFailure){
                return Center(
                  child: Text(
                    'Error: ${state.message}',
                    style: theme.textTheme.titleMedium?.copyWith(color: Colors.red),
                  ),
                );
              }
            if(state is ProductDetailsSuccessfuly) {
              return SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   // Image.network(state.productInfo.imageCover),
                    CarouselSlider(
                options: CarouselOptions(
                height: 300.0, // Height of the slider
                  autoPlay: true, // Auto-play the slider
                  enlargeCenterPage: true, // Enlarge the center image
                  aspectRatio: 16 / 9, // Aspect ratio of the images
                  autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
                  enableInfiniteScroll: true, // Infinite scrolling
                  autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
                  viewportFraction: 0.8, // Fraction of the viewport to show
                ),
                      items: state.productInfo.images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(

                                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color:Colors.black,

                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(5, 10), // Shadow position
                                    ),
                                  ]
                                ),
                                child:Image.network(image)
                            );
                          },
                        );
                      }).toList(),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            maxLines: 2,
                            state.productInfo.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              decorationColor: theme.canvasColor,
                              color: theme.canvasColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        AutoSizeText(
                          "${state.productInfo.sold} LYD",
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.canvasColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenheight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          0, 65, 130, 0.3))),
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
                                "⭐${state.productInfo.ratingsAverage} (${state.productInfo.quantity})",
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
                                  "0",
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
                            state.productInfo.description,
                            style: theme.textTheme.titleMedium?.copyWith(
                              decorationColor: theme.canvasColor,
                              color: theme.canvasColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: screenheight * 0.03),

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
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(
                                            50)),
                                    child: const Center(
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
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch,
                                  children: [
                                    FittedBox(
                                      alignment: Alignment.topLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Total price",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                          color: const Color.fromRGBO(
                                              6, 0, 79, 0.6),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      alignment: Alignment.topLeft,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "${state.productInfo.sold} LYD",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
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
                                      borderRadius: BorderRadius.circular(
                                          20), // Add rounded corners
                                    ),
                                    tileColor: theme.primaryColor,
                                    leading: const Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Colors.white,),
                                    title: FittedBox(
                                      alignment: Alignment.center,
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "Add to Cart",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
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
              );
            }
            else{
              return Container();
            }
          },

        ),
      ),
    );
  }
}
