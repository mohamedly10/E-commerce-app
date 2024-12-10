import 'package:flutter/material.dart';

class TextFildAcount extends StatelessWidget {
  late String title;
   TextFildAcount({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      SizedBox(height: screenheight * 0.03),
      FittedBox(
        alignment: Alignment.bottomLeft,
        fit: BoxFit.scaleDown,
        child: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: theme.canvasColor),
        ),
      ),
      SizedBox(height: screenheight * 0.02),
      SizedBox(
        width: screenwidth * 0.80,
        child: TextField(

          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.canvasColor),
            ),
            suffixIcon: Icon(Icons.edit),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    ],);
  }
}
