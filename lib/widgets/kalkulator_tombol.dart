import 'package:flutter/material.dart';

class KalkulatorTombol extends StatelessWidget {
  final String teks;
  final VoidCallback onPress; // Fungsi yang akan dijalankan saat ditekan
  final Color? warnaTeks;
  final Color? warnaTombol;

  const KalkulatorTombol({
    super.key,
    required this.teks,
    required this.onPress,
    this.warnaTeks = Colors.black,
    this.warnaTombol = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: warnaTombol,
            padding: const EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Text(
            teks,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: warnaTeks,
            ),
          ),
        ),
      ),
    );
  }
}