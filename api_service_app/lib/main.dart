import 'package:api_service_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
/*
routes: {
        CreatePage.tag: (context) => const CreatePage(),
        HomePage.tag: (context) => const HomePage(),
        SplashPage.tag: (context) => const SplashPage(),
      },
*/