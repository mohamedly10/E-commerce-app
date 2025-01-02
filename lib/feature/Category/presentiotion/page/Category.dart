import 'package:e_commerce_app/core/constant/constan_app.dart';
import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/feature/Category/presentiotion/manger/Category/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_widget/List_Category.dart';
import '../manger/Sub Category/cubit.dart';
import '../manger/Sub Category/state.dart';

class CategoryPage extends StatelessWidget {

  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = ConstantApp.allCategory;
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    int selectedIndex = (context).read<CategoryCubit>().categoryIndex??0;
    print(selectedIndex);
    return Scaffold(
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SubCategoryCubit()..fetchSubCategories(categories[selectedIndex].id))

        ],

        child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
          builder: (context, state) {
            var cubit = SubCategoryCubit.get(context);

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenwidth,
                      height: screenheight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Left side - Category List
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFFDBE4ED),
                                borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(20)),
                              ),
                              padding: const EdgeInsets.all(0),
                              child: ListView.builder(
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  bool isSelected = index == selectedIndex;
                                  return ListCategory(
                                    iselect: isSelected,
                                    onTab: () {
                                      selectedIndex = index;
                                      cubit.selectCategory(index);
                                      cubit.fetchSubCategories(
                                          categories[index].id);
                                    },
                                    name: categories[index].name,
                                  );
                                },
                              ),
                            ),
                          ),
                          // Right side - Content Area
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    cubit.categorySlelct ?? '',
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontSize: 14,
                                      color: theme.canvasColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/image/Frame 32.png'),
                                      ),
                                    ),
                                    width: screenwidth,
                                    height: screenwidth / 3,
                                  ),
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        if (state is SubCategoryLoading) {
                                          return const Center(
                                            child: CircularProgressIndicator(
                                                color: Colors.blue),
                                          );
                                        } else if (state is SubCategoryFailure) {
                                          return const Center(
                                              child: Text("Error occurred"));
                                        } else if (state is SubCategorySuccess) {

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            physics:
                                            const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 20.0,
                                              mainAxisSpacing: 60.0,
                                              childAspectRatio: 1,
                                            ),
                                            itemCount: state.subCategory.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: (){
                                                  Navigator.pushNamed(context, RouteName.ProductList,arguments: state.subCategory[index].category);
                                                },
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: 50,
                                                      height: 50,
                                                      decoration: BoxDecoration(
                                                        image: const DecorationImage(
                                                          image: AssetImage(
                                                              'assets/image/photo.png'),
                                                        ),
                                                        color: theme.primaryColor
                                                            .withOpacity(0.7),
                                                        borderRadius:
                                                        BorderRadius.circular(10),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        state.subCategory[index].name,
                                                        maxLines: 3,
                                                        overflow:
                                                        TextOverflow.ellipsis,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
    );
  }
}