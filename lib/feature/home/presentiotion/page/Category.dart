import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/feature/home/data/model/Category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_widget/List_Category.dart';
import '../manger/Category/cubit.dart';

class CategoryPage extends StatelessWidget {
   final  List<Category>? allCategory;

   CategoryPage({super.key, this.allCategory});


  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute
        .of(context)
        ?.settings
        .arguments as List<Category>;
    var screenheight = MediaQuery
        .of(context)
        .size
        .height;
    var screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      BlocProvider(
        create: (context) =>
        CategoryCubit(ServiceLocator().categoryUseCase)
          ..fetchCategories(),
        child: SingleChildScrollView(
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
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)),
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
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFDBE4ED),
                              borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(20)),
                            ),
                            height: screenheight,
                            width: screenwidth / 3,
                            padding: const EdgeInsets.all(0),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: category.length,
                              itemBuilder: (context, index) {
                                bool isSelected = index == _selectedIndex;
                                return ListCategory(
                                  iselect: isSelected, onTab: () {
                                  // setState(() {});
                                  // _selectedIndex = index;
                                },
                                  name: category[index].name,
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FittedBox(
                                    alignment: Alignment.topLeft,
                                    fit: BoxFit.scaleDown,
                                    child: Text("Xbox",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(fontSize: 14,
                                          color: theme.canvasColor,
                                          fontWeight: FontWeight.w500),)),
                                Container(
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/image/Frame 32.png'))),
                                  width: screenwidth,
                                  height: screenwidth / 3,
                                ),
                                SizedBox(
                                  width: screenwidth,
                                  height: screenheight,
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 20.0,
                                      mainAxisSpacing: 60.0,

                                      childAspectRatio:
                                      1,
                                    ),
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 100,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/image/photo.png')),
                                                color: theme.primaryColor
                                                    .withOpacity(0.7),
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                              ),

                                            ),
                                          ),
                                          Text("T-shirt"),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }

}

