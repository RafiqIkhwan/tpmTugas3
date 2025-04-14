import 'package:flutter/material.dart';

class KonversiWaktuPage extends StatefulWidget {
  @override
  _KonversiWaktuPageState createState() => _KonversiWaktuPageState();
}

class _KonversiWaktuPageState extends State<KonversiWaktuPage> {
  final TextEditingController _tahunController = TextEditingController();
  String _hasilKonversi = "";

  void _hitungKonversi() {
    double? tahun = double.tryParse(_tahunController.text);
    if (tahun == null || tahun < 0) {
      setState(() {
        _hasilKonversi = "Masukkan angka yang valid!";
      });
      return;
    }

    double jam = tahun * 365 * 24;
    double menit = jam * 60;
    double detik = menit * 60;

    setState(() {
      _hasilKonversi =
          "$tahun tahun =\n${jam.toStringAsFixed(0)} jam\n${menit.toStringAsFixed(0)} menit\n${detik.toStringAsFixed(0)} detik";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Konversi Waktu')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _tahunController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Masukkan tahun"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungKonversi,
              child: Text("Konversi"),
            ),
            SizedBox(height: 20),
            Text(
              _hasilKonversi,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
