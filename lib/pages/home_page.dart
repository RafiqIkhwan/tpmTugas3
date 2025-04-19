import 'package:flutter/material.dart';
import 'package:tugas3/pages/our_team.dart';
import 'package:tugas3/pages/help_page.dart';
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

  final List<Widget> _pages = [
    const MainMenuPage(), // Halaman Utama
    const OurTeamPage(), // Daftar Anggota
    const HelpPage(), // Bantuan & Logout
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 3',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[50], // Ubah ke ungu biasa
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple, // Ubah ke ungu biasa
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Anggota'),
            BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
          ],
        ),
      ),
    );
  }
}

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Utama')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard(
            context,
            title: 'Stopwatch',
            icon: Icons.timer,
            page: StopwatchPage(),
          ),
          _buildCard(
            context,
            title: 'Jenis Bilangan',
            icon: Icons.calculate,
            page: JenisBilanganPage(),
          ),
          _buildCard(
            context,
            title: 'Tracking LBS',
            icon: Icons.location_on,
            page: TrackingPage(),
          ),
          _buildCard(
            context,
            title: 'Konversi Waktu',
            icon: Icons.access_time,
            page: KonversiWaktuPage(),
          ),
          _buildCard(
            context,
            title: 'Favorit',
            icon: Icons.favorite,
            page: SitusRekomendasiPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Widget page,
  }) {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          ),
      splashColor: Colors.purple.withOpacity(0.3),
      borderRadius: BorderRadius.circular(12),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.deepPurple.shade100,
                child: Icon(icon, color: Colors.deepPurple),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }
}
