import 'package:flutter/material.dart';

class JenisBilanganPage extends StatefulWidget {
  const JenisBilanganPage({super.key});

  @override
  _JenisBilanganPageState createState() => _JenisBilanganPageState();
}

class _JenisBilanganPageState extends State<JenisBilanganPage> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  // Fungsi untuk mengecek jenis bilangan
  void _cekBilangan() {
    setState(() {
      String input = _controller.text.replaceAll(
        ',',
        '.',
      ); // Ganti koma dengan titik
      double? number = double.tryParse(input);

      if (number == null) {
        _result = 'Masukkan angka yang valid!';
        return;
      }

      List<String> jenis = [];

      // Cek bilangan pecahan
      if (number % 1 != 0) {
        jenis.add('Pecahan');
      } else {
        int intNumber = number.toInt();

        // Cek bilangan prima
        if (intNumber > 1 && _isPrime(intNumber)) {
          jenis.add('Prima');
        }

        // Cek bilangan cacah (>=0)
        if (intNumber >= 0) {
          jenis.add('Cacah');
        }

        // Cek bilangan bulat positif/negatif
        if (intNumber > 0) {
          jenis.add('Bulat Positif');
        } else if (intNumber < 0) {
          jenis.add('Bulat Negatif');
        }
      }

      // Jika bilangan tidak termasuk jenis di atas
      _result =
          jenis.isNotEmpty
              ? 'Jenis Bilangan: ${jenis.join(', ')}'
              : 'Bilangan tidak dikenali';
    });
  }

  // Fungsi untuk mengecek bilangan prima
  bool _isPrime(int num) {
    if (num < 2) return false;
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cek Jenis Bilangan')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Masukkan Bilangan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _cekBilangan, child: Text('Cek Jenis')),
            SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
