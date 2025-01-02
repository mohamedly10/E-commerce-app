import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/cubit.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    final String subCategoryId = ModalRoute.of(context)!.settings.arguments as String;
    debugPrint(subCategoryId);
    return BlocProvider(
      create: (context)=>ProductCubit()..fetchProduct(subCategoryId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
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
                  BlocBuilder<ProductCubit,ProductState>(
                    builder: (context,state){
                     if(state is ProuctLoading ){
                               return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.blue),
                        );
                      }
                      if (state is ProductSuccessfuly) {

                        return SizedBox(
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
                            itemCount:state.allProduct.length ,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteName.ProductDetails);
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          0, 65, 32, 0.3),
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Stack(children: [
                                          Image.network(
                                            width: screenwidth,
                                            state.allProduct[index].imageCover,
                                           fit: BoxFit.contain,
                                          ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.favorite,
                                                    color: theme
                                                        .primaryColor,)))
                                        ],),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .stretch,
                                          children: [
                                            AutoSizeText(
                                              state.allProduct[index].title,
                                          maxLines: 2,

                                                style: theme.textTheme
                                                    .titleMedium?.copyWith(
                                                  color: theme.canvasColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),

                                            FittedBox(
                                              alignment: Alignment.topLeft,
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                "",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme.textTheme
                                                    .titleMedium?.copyWith(
                                                  color: theme.canvasColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: screenwidth * 0.02),
                                            Row(
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "${state.allProduct[index].price} LYD",
                                                    style: theme.textTheme
                                                        .titleMedium?.copyWith(
                                                      color: theme.canvasColor,
                                                      fontWeight: FontWeight
                                                          .w400,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: screenwidth * 0.03),

                                              ],
                                            ),
                                            SizedBox(
                                                height: screenheight * 0.02),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                    "Review (${state.allProduct[index].ratingsAverage})⭐",
                                                    style: theme.textTheme
                                                        .titleMedium?.copyWith(
                                                      color: theme.canvasColor,
                                                      fontWeight: FontWeight
                                                          .w400,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: screenwidth * 0.03),
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
                        );
                      }
                      else {
                        return Container();
                      }
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

