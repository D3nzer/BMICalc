import 'package:bmi_calc/screens/bmi_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 48, 54, 95),
          fontFamily: 'Avenir',
          textTheme: textTheme(),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
          bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: const Color.fromARGB(255, 48, 54, 95),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(255, 48, 54, 95)),
          iconTheme: const IconThemeData(size: 90, color: Colors.white),
          useMaterial3: true),
      home: const BmiPage(),
    );
  }
}

TextTheme textTheme() {
  // ignore: prefer_const_constructors
  return TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );
}
