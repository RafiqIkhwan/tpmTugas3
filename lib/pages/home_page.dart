import 'package:flutter/material.dart';
import 'package:tugas3/pages/our_team.dart';
// import 'package:tugas3/pages/members_page.dart';
import 'package:tugas3/pages/help_page.dart';
// import 'package:tugas3/main.dart';

import 'package:tugas3/pages/stopwatch_page.dart';
import 'package:tugas3/pages/jenis_bilangan_page.dart';
import 'package:tugas3/pages/tracking_page.dart';
import 'package:tugas3/pages/konversi_waktu_page.dart';
import 'package:tugas3/pages/situs_rekomendasi_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar halaman dalam Bottom Navigation Bar
  final List<Widget> _pages = [
    MainMenuPage(),   // Halaman Utama
    OurTeamPage(),     // Daftar Anggota
    HelpPage(),       // Bantuan & Logout
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Anggota'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
        ],
      ),
    );
  }
}

// Halaman Utama (Berisi daftar fitur)
class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Utama')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Stopwatch'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StopwatchPage()),
              );
            },
          ),
          // Tambahkan fitur lainnya di sini
          ListTile(
            leading: Icon(Icons.format_list_numbered),
            title: Text('Cek Jenis Bilangan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JenisBilanganPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Tracking LBS'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackingPage()),
              );
            },
          ),
          ListTile(
              leading: Icon(Icons.access_time),
              title: Text('Konversi Waktu'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KonversiWaktuPage()),
                );
              },
            ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('Situs Rekomendasi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SitusRekomendasiPage()),
              );
            },
          ),


        ],
      ),
    );
  }
}

