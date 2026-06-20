import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/artikel.dart';

class ApiService {
  static const String baseUrl =
      'https://api.spaceflightnewsapi.net/v4/articles/?limit=20';

  // Mengambil daftar berita dari REST API sesuai target soal.
  static Future<List<Article>> fetchArticles() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((e) => Article.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data berita');
    }
  }
}
