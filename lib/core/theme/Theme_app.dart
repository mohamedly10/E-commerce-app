import 'package:flutter/material.dart';

class Theme_App {
  static var primarycolor = const Color(0xFF004182);
  static var font_color = const Color(0xFF06004F);


  static ThemeData lightMode = ThemeData(
    canvasColor: font_color,
    primaryColor:primarycolor ,
      appBarTheme:  AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 20,
              fontWeight: FontWeight.w500,
              color: font_color,
              fontFamily: 'Poppins'),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        unselectedItemColor: const Color(0xFFC6C6C6),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1A1A1A
        ),
        selectedItemColor: primarycolor,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 30,
            color: Colors.white,
            fontFamily: 'Poppins'),
        titleMedium: TextStyle(fontSize: 20,
            color: Colors.white,
            fontFamily: 'Poppins'),
        titleSmall: TextStyle(fontSize: 10,
            color: Colors.white,
            fontFamily: 'Poppins'),

      )

  );
//   static ThemeData DarkeMode =ThemeData(
//
//       dividerTheme: DividerThemeData(color: Color(0xFFFACC1D)),
//       appBarTheme: AppBarTheme(
//
//           iconTheme: IconThemeData(
//             color: Color(0xFFF8F8F8),
//           ),
//           titleTextStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Color(0xFFF8F8F8),fontFamily: 'elMussiri'),
//           backgroundColor: Colors.transparent
//       ),
//       scaffoldBackgroundColor: Colors.transparent,
//       bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
//         unselectedItemColor: Color(0xFFF8F8F8),
//         type:BottomNavigationBarType.fixed ,
//         backgroundColor: Color(0xFF141A2E),
//         selectedItemColor: Color(0xFFFACC1D),
//       ),
//       textTheme: const TextTheme(
//         titleLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFFF8F8F8), fontFamily:'elMussiri'),
//         bodySmall: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xFFFACC1D),fontFamily: 'elMussiri'),
//         bodyMedium: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color(0xFFF8F8F8),fontFamily: 'elMussiri'),
//         bodyLarge: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xFFF8F8F8),fontFamily: 'elMussiri'),
//         displaySmall: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFFF8F8F8),fontFamily: 'elMussiri'),
//       )
//
//   );
//
// }
}