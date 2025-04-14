import 'package:flutter/material.dart';
import 'package:tugas3/pages/konversi_waktu_page.dart';
import 'package:tugas3/pages/stopwatch_page.dart';
import 'package:tugas3/pages/jenis_bilangan_page.dart';
import 'package:tugas3/pages/tracking_page.dart';
import 'package:tugas3/pages/situs_rekomendasi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Utama')),
      body: ListView(
        children: [
          _buildListTile(context, title: 'Stopwatch', page: StopwatchPage()),
          _buildListTile(
            context,
            title: 'Jenis Bilangan',
            page: JenisBilanganPage(),
          ),
          _buildListTile(context, title: 'Tracking LBS', page: TrackingPage()),
          _buildListTile(
            context,
            title: 'Konversi Waktu',
            page: KonversiWaktuPage(),
          ),
          _buildListTile(
            context,
            title: 'Favorit',
            page: SitusRekomendasiPage(),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat ListTile
  Widget _buildListTile(
    BuildContext context, {
    required String title,
    required Widget page,
  }) {
    return ListTile(
      title: Text(title),
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          ),
    );
  }
}

// Contoh penggunaan FutureBuilder untuk operasi asinkron
class ExamplePage extends StatelessWidget {
  Future<String> fetchData() async {
    // Simulasi operasi berat
    await Future.delayed(Duration(seconds: 2));
    return "Data berhasil dimuat!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example Page')),
      body: FutureBuilder<String>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else {
            return Center(child: Text(snapshot.data ?? 'Data kosong'));
          }
        },
      ),
    );
  }
}
