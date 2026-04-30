import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/grooming_page.dart';
import 'pages/penitipan_page.dart'; 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (context) => const HomePage(),
        '/grooming': (context) => GroomingPage(),
        '/penitipan': (context) => PenitipanPage(),
      },

      initialRoute: '/',
    );
  }
}
