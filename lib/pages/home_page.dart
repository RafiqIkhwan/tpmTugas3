import 'package:flutter/material.dart';
// import 'package:tugas3/pages/members_page.dart';
// import 'package:tugas3/pages/help_page.dart';
// import 'package:tugas3/main.dart';

import 'package:tugas3/pages/stopwatch_page.dart';
import 'package:tugas3/pages/jenis_bilangan_page.dart';
import 'package:tugas3/pages/tracking_page.dart';
import 'package:tugas3/pages/konversi_waktu_page.dart';
import 'package:tugas3/pages/situs_rekomendasi_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Daftar halaman dalam Bottom Navigation Bar
  final List<Widget> _pages = [
    MainMenuPage(),   // Halaman Utama
    MemberPage(),     // Daftar Anggota
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

// Halaman Daftar Anggota
class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Anggota')),
      body: Center(child: Text('Daftar anggota kelompokmu di sini')),
    );
  }
}

// Halaman Bantuan & Logout
class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bantuan')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cara penggunaan aplikasi ini...'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
