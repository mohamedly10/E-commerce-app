

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return   Row(
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
    );
  }
}
