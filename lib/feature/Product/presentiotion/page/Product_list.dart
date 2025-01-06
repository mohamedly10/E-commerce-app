import 'package:e_commerce_app/core/route/route_name.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/cubit.dart';
import 'package:e_commerce_app/feature/Product/presentiotion/manger/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Custom_Widget/Search Bar.dart';
import 'custom_widget/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final String subCategoryId = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) => ProductCubit()..fetchProduct(subCategoryId),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Spacer
              SizedBox(height: screenHeight * 0.09),

              // Logo
              Image.asset(
                "assets/image/route_icon.png",
                height: screenHeight * 0.03,
                width: screenWidth * 0.03,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),

              // Search Bar
              const Stack(
                children: [
                  Positioned(child: Search_Bar()),
                ],
              ),

              // Product Grid
              Expanded( // Allow GridView to take up the remaining space
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is ProuctLoading) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.blue),
                      );
                    }
                    if (state is ProductSuccessfuly) {
                      return GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: state.allProduct.length,
                        itemBuilder: (context, index) {
                          return ProductItem(
                            product: state.allProduct[index],
                            theme: theme,
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.ProductDetails,
                                arguments: state.allProduct[index].id,
                              );
                            },
                          );
                        },
                      );
                    }
                    if (state is ProductFailure) {
                      return Center(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            'Error: ${state.message}',
                            style: theme.textTheme.titleMedium?.copyWith(color: Colors.red),
                          ),
                        ),
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
    );
  }

}

