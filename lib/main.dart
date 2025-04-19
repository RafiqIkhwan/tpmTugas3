import 'package:flutter/material.dart';
import 'package:tugas3/pages/login_page.dart'; // pastikan path ini sesuai

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 3',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(), // arahkan langsung ke halaman login
    );
  }
}
