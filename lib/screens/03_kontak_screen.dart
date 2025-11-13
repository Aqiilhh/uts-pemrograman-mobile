import 'package:flutter/material.dart';

class KontakScreen extends StatelessWidget {
  KontakScreen({super.key});

  // (Soal d) Data bersifat statis, berasal dari variable saja.
  // (Soal d) Setidaknya ada 15 kontak telepon.
  final List<Map<String, String>> daftarKontak = [
    {'nama': 'Galih Ashari', 'telepon': '081234567890'},
    {'nama': 'Andi Budiman', 'telepon': '081222334455'},
    {'nama': 'Citra Lestari', 'telepon': '085678901234'},
    {'nama': 'Dewi Sartika', 'telepon': '087811223344'},
    {'nama': 'Eko Prasetyo', 'telepon': '089900112233'},
    {'nama': 'Fajar Nugroho', 'telepon': '081123456789'},
    {'nama': 'Gita Permata', 'telepon': '082233445566'},
    {'nama': 'Hadi Wijaya', 'telepon': '083344556677'},
    {'nama': 'Indah Cahyani', 'telepon': '084455667788'},
    {'nama': 'Joko Susilo', 'telepon': '085566778899'},
    {'nama': 'Kurnia Dewi', 'telepon': '086677889900'},
    {'nama': 'Lina Marlina', 'telepon': '087788990011'},
    {'nama': 'Mega Mendung', 'telepon': '088899001122'},
    {'nama': 'Nina Kirana', 'telepon': '089900112233'},
    {'nama': 'Opik Hidayat', 'telepon': '081234509876'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak'),
      ),
      // Gunakan ListView.builder untuk membuat daftar yang bisa di-scroll
      body: ListView.builder(
        itemCount: daftarKontak.length, // Total item sesuai jumlah data
        itemBuilder: (context, index) {
          // Ambil data satu kontak berdasarkan index
          final kontak = daftarKontak[index];

          // (Soal d) Layout user hanya terdiri dari teks dan circle image saja
          return ListTile(
            leading: CircleAvatar(
              // Tampilkan inisial nama di CircleAvatar
              child: Text(kontak['nama']![0]), // Ambil huruf pertama
            ),
            title: Text(kontak['nama']!),
            subtitle: Text(kontak['telepon']!),
            trailing: const Icon(Icons.phone), // Tambahan kecil biar bagus
            onTap: () {
              // Aksi saat di-tap (tidak wajib di soal)
              print('Menelpon ${kontak['nama']}...');
            },
          );
        },
      ),
    );
  }
}