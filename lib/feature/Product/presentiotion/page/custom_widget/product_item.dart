import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final dynamic product;
  final ThemeData theme;
  final double screenWidth;
  final double screenHeight;
  final VoidCallback onTap;

  const ProductItem({
    super.key,
    required this.product,
    required this.theme,
    required this.screenWidth,
    required this.screenHeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(0, 65, 32, 0.3)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            // Product Image
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    width: screenWidth,
                    product.imageCover,
                    fit: BoxFit.contain,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: theme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AutoSizeText(
                    product.title,
                    maxLines: 2,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.canvasColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    children: [
                      Text(
                        "${product.price} LYD",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.canvasColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "Review (${product.ratingsAverage})⭐",
                        maxLines: 1,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.canvasColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outlined,
                        color: theme.primaryColor,
                        size: 40,
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
  }
}