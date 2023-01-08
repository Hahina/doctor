import 'package:doctor/core/router.dart';
import 'package:flutter/material.dart';

class Doctor extends StatelessWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Виноградний лікар',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 35, 85, 62),
        primaryColorDark: const Color.fromARGB(255, 11, 63, 46),
        backgroundColor: const Color.fromARGB(255, 247, 173, 173),
        scaffoldBackgroundColor: const Color.fromARGB(255, 202, 245, 215),
        
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 24, 133, 91))
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
          primary: const Color.fromARGB(255, 24, 133, 91),
          side: const BorderSide(color: Color.fromARGB(255, 24, 133, 91), width: 1),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 24, 133, 91),
          foregroundColor: Color.fromARGB(255, 250, 252, 251),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 24, 133, 91),
          selectedItemColor: Color.fromARGB(255, 244, 247, 244),
          unselectedItemColor: Color.fromARGB(255, 138, 187, 141),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 24, 133, 91).withOpacity(0.4)
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 24, 133, 91)),
          ),
          labelStyle: TextStyle (color: const Color.fromARGB(255, 24, 133, 91).withOpacity(0.4))
        ),
        
      ),
      routes: Routes.system,
      initialRoute: Routes.home,
    );
  }
}