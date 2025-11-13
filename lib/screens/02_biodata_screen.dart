import 'package:flutter/material.dart';

class BiodataScreen extends StatefulWidget {
  const BiodataScreen({super.key});

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  // Controller untuk TextField
  final TextEditingController _namaController =
      TextEditingController(text: "Rizky Aqil Hibatullah");

  // Variabel state untuk menyimpan nilai input
  String? _jenisKelamin = 'Laki-laki'; // Nilai awal untuk RadioButton
  String? _jurusan = 'Informatika'; // Nilai awal untuk Dropdown
  DateTime _tanggalLahir = DateTime.now();

  // Daftar pilihan untuk Dropdown
  final List<String> _listJurusan = [
    'Informatika',
    'Sistem Informasi',
    'Teknik Elektro',
    'Teknik Mesin',
    'Teknik Sipil',
  ];

  // Fungsi untuk menampilkan Date Picker (Kalender)
  Future<void> _pilihTanggal(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _tanggalLahir,
      firstDate: DateTime(1980),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _tanggalLahir) {
      setState(() {
        _tanggalLahir = picked;
      });
    }
  }

  @override
  void dispose() {
    _namaController.dispose(); // Jangan lupa dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata'),
      ),
      // Gunakan SingleChildScrollView agar tidak overflow saat keyboard muncul
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Foto Profil (Soal c: image foto profile)
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage:
                      AssetImage('assets/images/akil.jpg'),
                ),
              ),
              const SizedBox(height: 24),

              // 2. Isian Teks (Soal c: teks)
              const Text(
                'Nama Lengkap',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextField(
                controller: _namaController,
                decoration: const InputDecoration(
                  hintText: 'Masukkan nama lengkap',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),

              // 3. Radio Button (Soal c: radio button)
              const Text(
                'Jenis Kelamin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              RadioListTile<String>(
                title: const Text('Laki-laki'),
                value: 'Laki-laki',
                groupValue: _jenisKelamin,
                onChanged: (String? value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Perempuan'),
                value: 'Perempuan',
                groupValue: _jenisKelamin,
                onChanged: (String? value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // 4. Dropdown (Soal c: dropdown)
              const Text(
                'Jurusan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _jurusan,
                    items: _listJurusan.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _jurusan = newValue;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 5. Calendar (Soal c: calendar)
              const Text(
                'Tanggal Lahir',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      // Format tanggal sederhana
                      "${_tanggalLahir.toLocal()}".split(' ')[0],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _pilihTanggal(context),
                    child: const Text('Pilih Tanggal'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}