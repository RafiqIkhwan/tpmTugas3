import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SitusRekomendasiPage extends StatefulWidget {
  @override
  _SitusRekomendasiPageState createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> {
  final List<Map<String, String>> _situs = [
    {
      'title': 'Google',
      'url': 'https://www.google.com',
      'image': 'https://www.google.com/favicon.ico'
    },
    {
      'title': 'Flutter',
      'url': 'https://flutter.dev',
      'image': 'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png'
    },
    {
      'title': 'GitHub',
      'url': 'https://github.com',
      'image': 'https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png'
    },
  ];

  final List<Map<String, String>> _favoriteSitus = [];

  void _toggleFavorite(Map<String, String> situs) {
    setState(() {
      if (_favoriteSitus.contains(situs)) {
        _favoriteSitus.remove(situs);
      } else {
        _favoriteSitus.add(situs);
      }
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak dapat membuka link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Situs Rekomendasi'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Semua Situs'),
              Tab(text: 'Favorite ❤️'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildSitusList(_situs),
            _buildSitusList(_favoriteSitus),
          ],
        ),
      ),
    );
  }

  Widget _buildSitusList(List<Map<String, String>> situsList) {
    return ListView.builder(
      itemCount: situsList.length,
      itemBuilder: (context, index) {
        final situs = situsList[index];
        return Card(
          child: ListTile(
            leading: Image.network(situs['image']!, width: 40, height: 40, errorBuilder: (context, error, stackTrace) => Icon(Icons.image)),
            title: Text(situs['title']!),
            subtitle: Text(situs['url']!),
            trailing: IconButton(
              icon: Icon(
                _favoriteSitus.contains(situs) ? Icons.favorite : Icons.favorite_border,
                color: _favoriteSitus.contains(situs) ? Colors.red : null,
              ),
              onPressed: () => _toggleFavorite(situs),
            ),
            onTap: () => _launchURL(situs['url']!),
          ),
        );
      },
    );
  }
}
