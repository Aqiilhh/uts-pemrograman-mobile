import 'dart:async'; // Untuk Timer
import 'package:flutter/material.dart';
import 'package:uts/screens/01_dashboard_screen.dart'; // Halaman tujuan

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk pindah halaman setelah 5 detik 
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ganti 'assets/images/foto_profil.jpg' dengan path foto kamu
            Image.asset(
              'assets/images/akil.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            const Text(
              'Aplikasi UTS Mobile', // Judul Aplikasi 
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'NIM: 152023052', // Ganti dengan NIM kamu 
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Nama: Rizky Aqil', // Ganti dengan Nama kamu 
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}