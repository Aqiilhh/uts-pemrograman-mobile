import 'package:flutter/material.dart';
import 'package:uts/screens/02_biodata_screen.dart';
import 'package:uts/screens/03_kontak_screen.dart';
import 'package:uts/screens/04_kalkulator_screen.dart';
import 'package:uts/screens/05_cuaca_screen.dart';
import 'package:uts/screens/06_berita_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Index untuk melacak tab yang aktif

  // Daftar halaman/fragment sesuai menu 
  static final List<Widget> _widgetOptions = <Widget>[
    const BiodataScreen(),
    KontakScreen(),
    const KalkulatorScreen(),
    const CuacaScreen(),
    BeritaScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body akan menampilkan halaman yang dipilih
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      // Ini adalah Bottom Navigation Bar 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[800], // Warna item aktif
        unselectedItemColor: Colors.grey, // Warna item non-aktif
        showUnselectedLabels: true, // Tampilkan label walau tidak aktif
        onTap: _onItemTapped, // Fungsi saat item di-tap
        type: BottomNavigationBarType.fixed, // Agar semua 5 item muat
      ),
    );
  }
}