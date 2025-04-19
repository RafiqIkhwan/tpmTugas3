import 'package:flutter/material.dart';
import 'package:tugas3/pages/home_page.dart';
import 'package:tugas3/pages/login_page.dart';
import 'package:tugas3/main.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bantuan & Logout'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ), // Kembali ke MainPage
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Panduan Penggunaan Aplikasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. Stopwatch: Fitur ini digunakan untuk mengukur waktu secara presisi. Anda dapat memulai, menghentikan, dan mereset stopwatch sesuai kebutuhan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '2. Jenis Bilangan: Fitur ini membantu Anda menentukan jenis bilangan, seperti bilangan prima, desimal, bulat positif/negatif, atau bilangan cacah, berdasarkan input yang diberikan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '3. Tracking LBS: Fitur ini memungkinkan Anda untuk melacak lokasi menggunakan layanan berbasis lokasi (LBS). Lokasi Anda akan ditampilkan dalam bentuk koordinat latitude dan longitude.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '4. Konversi Waktu: Fitur ini digunakan untuk mengonversi waktu dari satu satuan ke satuan lainnya, seperti tahun ke jam, menit, atau detik.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '5. Daftar Situs Rekomendasi: Fitur ini menyediakan daftar situs rekomendasi yang dilengkapi dengan gambar dan link yang dapat Anda kunjungi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '6. Favorit: Fitur ini memungkinkan Anda untuk menandai situs favorit dari daftar rekomendasi, sehingga Anda dapat mengaksesnya dengan lebih mudah.',
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Warna tombol merah
                  foregroundColor: Colors.black, // Warna teks hitam
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
