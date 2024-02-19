import 'package:flutter/material.dart';
import 'package:sneaker_app/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Lato",
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
          useMaterial3: true,
          colorSchemeSeed: const Color.fromRGBO(204, 204, 0, 0.8)),
      home: const MyHomePage(),
    );
  }
}
