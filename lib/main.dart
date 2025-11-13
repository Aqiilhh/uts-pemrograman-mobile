import 'package:flutter/material.dart';
import 'package:uts/screens/00_splash_screen.dart'; // Sesuaikan path jika beda

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Pemrograman Mobile',
      theme: ThemeData(
        primarySwatch: Colors.purple, // Biar senada dengan soal
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Halaman pertama yang dibuka
    );
  }
}