import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum_3/auth/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<News>> newsList;

  @override
  void initState() {
    super.initState();
    newsList = fetchNews();
  }

  Future<List<News>> fetchNews() async {
    try {
      final response =
          await http.get(Uri.parse('https://api-berita-indonesia.vercel.app/tempo/gaya/'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data['success'] == true) {
          final List<dynamic> posts = data['data']['posts'];

          return List<News>.from(posts.map((item) => News.fromJson(item)));
        } else {
          throw Exception('API request unsuccessful');
        }
      } else {
        throw Exception('Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<News>>(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return buildNewsCard(snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildNewsCard(News news) {
    return ListTile(
      title: Text(news.title),
      subtitle: Text(news.description),
      leading: Image.network(news.thumbnail),
    );
  }
}

class News {
  final String link;
  final String title;
  final String pubDate;
  final String description;
  final String thumbnail;

  News({
    required this.link,
    required this.title,
    required this.pubDate,
    required this.description,
    required this.thumbnail,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      link: json['link'] ?? '',
      title: json['title'] ?? '',
      pubDate: json['pubDate'] ?? '',
      description: json['description'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}
