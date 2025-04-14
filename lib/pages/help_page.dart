import 'package:flutter/material.dart';
import 'package:tugas3/pages/login_page.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bantuan & Logout')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Panduan Penggunaan Aplikasi'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
