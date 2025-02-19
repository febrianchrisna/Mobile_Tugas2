import 'package:flutter/material.dart';
import 'package:tugas2/pages/login/login.dart';

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
      title: 'Aplikasi TPM',
      theme: ThemeData(fontFamily: "SF-Pro-Text"),
      home: const LoginPage(),
    );
  }
}