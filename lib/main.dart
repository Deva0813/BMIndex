import 'package:bmi_calc/screens/home.dart';
import 'package:bmi_calc/screens/result.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF03051C),
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF03051C),
            titleTextStyle: TextStyle(
              fontFamily: "Poppins",
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            ),
          toolbarHeight: 70.0,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: "Poppins"
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/result": (context) => const Results(),
      }
    );
  }
}
