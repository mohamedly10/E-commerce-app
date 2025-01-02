import 'package:e_commerce_app/core/Layout/manger/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import '../../../../core/constant/constan_app.dart';
import '../manger/Category/cubit.dart';
import '../manger/Category/state.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
         var cubit= CategoryCubit.get(context);
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          } else if (state is CategoryFild) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      cubit.fetchCategories();
                    },
                    child: const Text("إعادة المحاولة"),
                  ),
                ],
              ),
            );
          } else if (state is CategorySuccess) {

         return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: screenHeight * 0.09),
                    Image.asset(
                      "assets/image/route_icon.png",
                      height: screenHeight * 0.03,
                      width: screenWidth * 0.03,
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 10, top: 20),
                          width: screenWidth * 0.80,
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'ما الذي تبحث عنه؟',
                            ),
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: screenWidth * 0.10,
                            color: theme.primaryColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: screenWidth,
                      child: ImageSlideshow(
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Image.asset(
                              "assets/image/ads.png",
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Category",
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: const Color(0xFF06004F)),
                    ),
                    SizedBox(

                      width: screenWidth,
                      height: screenHeight * 0.35,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              (context).read<NavigationCubit>().setIndex(1);
                            cubit.categoryIndex=index;
                            print(cubit.categoryIndex);
                            },
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          state.categories[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  margin: const EdgeInsets.all(10),
                                ),
                                Text(state.categories[index].name),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(child: Text("لا يوجد بيانات حاليًا"));
        },
      ),
    );
  }
}
