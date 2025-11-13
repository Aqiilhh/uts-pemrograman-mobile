import 'package:flutter/material.dart';

class CuacaScreen extends StatelessWidget {
  const CuacaScreen({super.key});

  // Helper widget untuk item info (Kelembapan, Angin, dll)
  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 8),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }

  // Helper widget untuk item forecast per jam
  Widget _buildHourlyForecastItem(
      String time, String iconPath, String temp) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Image.asset(iconPath, width: 40, height: 40),
          const SizedBox(height: 8),
          Text(temp, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background abu-abu muda
      // Kita pakai SingleChildScrollView agar bisa di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40), // Jarak dari atas (status bar)
              const Text(
                'Bandung, Indonesia',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Kam, 13 Nov 2025',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // (Soal f) Card Utama Cuaca Saat Ini
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.purple[400], // Warna ungu
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // (Soal f) Gambar animasi/kondisi cuaca
                        // Ganti 'cuaca_cerah.png' dengan nama file gambarmu
                        Image.asset(
                          'assets/images/cuaca_cerah.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(width: 20),
                        // (Soal f) Informasi Suhu
                        const Text(
                          '22°',
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Cerah Berawan',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: Colors.white54),
                    const SizedBox(height: 12),
                    // (Soal f) Informasi suhu, kelembapan, dan lain-lain
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildInfoItem(Icons.water_drop_outlined, '86%', 'Humidity'),
                        _buildInfoItem(Icons.air, '3 km/h', 'Wind'),
                        _buildInfoItem(Icons.thermostat, '20°', 'Feels Like'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Teks "Today"
              const Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Forecast Per Jam (Horizontal ListView)
              SizedBox(
                height: 150, // Beri tinggi tetap untuk horizontal list
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Ganti path gambarnya sesuai yang kamu punya
                    _buildHourlyForecastItem(
                        '08:00', 'assets/images/cuaca_cerah.png', '19°'),
                    _buildHourlyForecastItem(
                        '11:00', 'assets/images/cuaca_cerah.png', '22°'),
                    _buildHourlyForecastItem(
                        '14:00', 'assets/images/cuaca_hujan.png', '21°'),
                    _buildHourlyForecastItem(
                        '17:00', 'assets/images/cuaca_cerah.png', '20°'),
                    _buildHourlyForecastItem(
                        '20:00', 'assets/images/cuaca_awan.png', '18°'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}