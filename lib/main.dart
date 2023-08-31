import 'package:bmi_calc/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF03051C),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color(0xFF03051C),
            titleTextStyle: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          toolbarHeight: 70.0,
        ),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.poppins(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
