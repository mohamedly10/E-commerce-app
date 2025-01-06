import 'package:auto_size_text/auto_size_text.dart';
import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/feature/Category/presentiotion/manger/Category/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Custom_Widget/Logo.dart';
import '../../../../core/Custom_Widget/Search Bar.dart';
import '../custom_widget/List_Category.dart';
import '../manger/Sub Category/cubit.dart';
import '../manger/Sub Category/state.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = (context).read<CategoryCubit>().categories;
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    int selectedIndex = (context).read<CategoryCubit>().categoryIndex ?? 0;
    return Scaffold(
      body: BlocProvider(
        create: (context) => SubCategoryCubit()
          ..fetchSubCategories(categories[selectedIndex].id),
        child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
            builder: (context, state) {
          var cubit = SubCategoryCubit.get(context);
          return Column(
            children: [
              SizedBox(height: screenheight * 0.1),
              const Align(alignment: Alignment.topLeft, child: Logo()),
              const Search_Bar(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFDBE4ED),
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20)),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: ListView.builder(
                          physics: const ScrollPhysics(),
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            bool isSelected = index == selectedIndex;
                            return ListCategory(
                              iselect: isSelected,
                              onTab: () {
                                if (selectedIndex != index) {
                                  selectedIndex = index;
                                  cubit.selectCategory(index);
                                  cubit
                                      .fetchSubCategories(categories[index].id);
                                }
                              },
                              name: categories[index].name,
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Builder(builder: (context) {
                        if (state is SubCategoryLoading) {
                          return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.blue),
                          );
                        } else if (state is SubCategoryFailure) {
                          return const Center(child: Text("Error occurred"));
                        } else if (state is SubCategorySuccess) {
                          return Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                                width: screenwidth *0.70,
                              child: GridView.builder(

                                padding: const EdgeInsets.only(right: 20,top: 12),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(

                                  crossAxisCount: 2,
                                childAspectRatio: 4/2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: state.subCategory.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, RouteName.ProductList,arguments: state.subCategory[index].category);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.zero,

                                      decoration: const BoxDecoration(

                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        color: Color(0xFFDBE4ED),
                                      ),

                                      child: Center(
                                        child: AutoSizeText(
                                          maxLines: 3,
                                          state.subCategory[index].name,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }
                        return const Placeholder();
                      }),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   var categories = ConstantApp.allCategory;
//   var screenheight = MediaQuery.of(context).size.height;
//   var screenwidth = MediaQuery.of(context).size.width;
//   var theme = Theme.of(context);
//   int selectedIndex = (context).read<CategoryCubit>().categoryIndex??0;
//   return Scaffold(
//     backgroundColor: Colors.white,
//     body: BlocProvider(
//
//        create: (context) =>SubCategoryCubit()..fetchSubCategories(categories[selectedIndex].id),
//
//
//       child: BlocBuilder<SubCategoryCubit, SubCategoryState>(
//         builder: (context, state) {
//           var cubit = SubCategoryCubit.get(context);
//
//           return Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: screenheight*0.10,),
//                 SizedBox(
//                   width: screenwidth,
//                   height: screenheight,
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFDBE4ED),
//                             borderRadius:
//                             BorderRadius.only(topLeft: Radius.circular(20)),
//                           ),
//                           padding: const EdgeInsets.all(0),
//                           child: ListView.builder(
//                             itemCount: categories.length,
//                             itemBuilder: (context, index) {
//                               bool isSelected = index == selectedIndex;
//                               return ListCategory(
//                                 iselect: isSelected,
//                                 onTab: () {
//                               if(selectedIndex!=index){
//                                 selectedIndex = index;
//                                 cubit.selectCategory(index);
//                                 cubit.fetchSubCategories(
//                                     categories[index].id);
//                               }
//
//                                 },
//                                 name: categories[index].name,
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       // Right side - Content Area
//                       Expanded(
//                         flex: 2,
//                         child: SizedBox(
//                           height: 100,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 Text(
//                                   maxLines: 2,
//                                   cubit.categorySlelct ?? '',
//                                   style: theme.textTheme.titleMedium?.copyWith(
//                                     fontSize: 14,
//                                     color: theme.canvasColor,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 Container(
//                                   decoration: const BoxDecoration(
//                                     image: DecorationImage(
//                                       image: AssetImage(
//                                           'assets/image/Frame 32.png'),
//                                     ),
//                                   ),
//                                   width: screenwidth,
//                                   height: screenwidth / 3,
//                                 ),
//                                 Expanded(
//                                   child: Builder(
//                                     builder: (context) {
//                                       if (state is SubCategoryLoading) {
//                                         return const Center(
//                                           child: CircularProgressIndicator(
//                                               color: Colors.blue),
//                                         );
//                                       } else if (state is SubCategoryFailure) {
//                                         return const Center(
//                                             child: Text("Error occurred"));
//                                       } else if (state is SubCategorySuccess) {
//
//                                         return GridView.builder(
//                                           padding: EdgeInsets.zero,
//                                           physics:const AlwaysScrollableScrollPhysics()
//                                           ,
//                                           gridDelegate:
//                                           const SliverGridDelegateWithFixedCrossAxisCount(
//                                             crossAxisCount: 3,
//                                             crossAxisSpacing: 20.0,
//                                             mainAxisSpacing: 60.0,
//                                             childAspectRatio: 1,
//                                           ),
//                                           itemCount: state.subCategory.length,
//                                           itemBuilder: (context, index) {
//                                             return InkWell(
//                                               onTap: (){
//                                                 Navigator.pushNamed(context, RouteName.ProductList,arguments: state.subCategory[index].category);
//                                               },
//                                               child: Column(
//
//                                                 children: [
//                                                   Container(
//                                                     width: 50,
//                                                     height: 50,
//                                                     decoration: BoxDecoration(
//                                                       image: const DecorationImage(
//                                                         image: AssetImage(
//                                                             'assets/image/photo.png'),
//                                                       ),
//                                                       color: theme.primaryColor
//                                                           .withOpacity(0.7),
//                                                       borderRadius:
//                                                       BorderRadius.circular(10),
//                                                     ),
//                                                   ),
//                                                   Expanded(
//                                                     child: Text(
//                                                       state.subCategory[index].name,
//                                                       maxLines: 2,
//                                                       overflow:
//                                                       TextOverflow.ellipsis,
//                                                       textAlign: TextAlign.center,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       }
//                                       return Container();
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
}
