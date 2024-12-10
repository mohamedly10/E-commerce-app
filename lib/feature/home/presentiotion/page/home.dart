import 'package:dio/dio.dart';
import 'package:e_commerce_app/feature/home/presentiotion/manger/Category/cubit.dart';
import 'package:e_commerce_app/feature/home/presentiotion/manger/Category/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../../core/di/di.dart';
import '../../../../core/route/route_name.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) =>
            CategoryCubit(ServiceLocator().categoryUseCase)..fetchCategories(),
        child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
          if (state is CategoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CategoryFild) {
            return const Center(child: Text("we have error"));
          } else if (state is CategorySuccess) {
            var allcategories = state.categories;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            margin: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 20),
                            width: screenwidth * 0.80,
                            child: const TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                                filled: true,
                                // Ensures the fillColor is applied
                                fillColor: Colors.white,
                                hintText: 'What do you Search For...',
                              ),
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: screenwidth * 0.10,
                              color: theme.primaryColor,
                            ),
                          )
                        ],
                      ),
                      // SizedBox(height: screenheight*0.02),
                      SizedBox(
                        width: screenwidth,
                        child: ImageSlideshow(
                          autoPlayInterval: 3000,
                          isLoop: true,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: Image.asset(
                                "assets/image/ads.png",
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ),
                      ),
                      Text("Category",
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: Color(0xFF06004F))),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: screenwidth,
                        height: screenheight * 0.35,
                        child: GridView.count(

                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 2,
                          children:
                              List.generate(allcategories.length, (index) {
                            // Only 4 items (2 rows of 2)
                            return InkWell(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, RouteName.Category_page,arguments: state.categories);
                                print(state.categories[index].id);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                allcategories[index].image),
                                            fit: BoxFit.cover),
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(90)),
                                    margin: const EdgeInsets.all(10),
                                  ),
                                  Text(allcategories[index].name)
                                ],
                              ),
                            );
                          }),
                        ),
                      )
                    ]),
              ),
            );
          }
          return Center(
              child: InkWell(
                  onTap: () {
                    BlocProvider.of<CategoryCubit>(context).fetchCategories();

                  },
                  child: const Text("we have error please try again")));
        }),
      ),
    );
  }
}
