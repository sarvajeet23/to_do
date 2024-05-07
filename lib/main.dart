import 'package:flutter/material.dart';
import 'package:to_do/pages/add_user_page.dart';
import 'package:to_do/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      initialRoute: "/Home",
      routes: {
        "/Home": (context) => const HomePage(),
        "/Form": (context) => const AddUserPage()
      },
    );
  }
}
