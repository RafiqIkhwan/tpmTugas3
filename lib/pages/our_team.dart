import 'package:flutter/material.dart';

class OurTeamPage extends StatelessWidget {
  const OurTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8E9F0), // Warna latar belakang
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "OUR TEAM",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                _buildTeamMember("assets/profile3.jpg", "RAFIQ IKHWAN NUGRAHA", "123220071"),
                _buildTeamMember("assets/profile.jpg", "SYIFA NUR RAMADHANI", "123220194"),
                _buildTeamMember("assets/profile2.jpg", "MUH. NAUFAL FAUZI ALI", "123220207"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamMember(String imagePath, String name, String id) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}