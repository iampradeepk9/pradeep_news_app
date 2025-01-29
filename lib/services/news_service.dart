import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_article.dart';

class NewsService {
  final String apiKey = "56b8cd2b3fea457a90d85f87002e1c75";
  final String baseUrl = "https://newsapi.org/v2/everything";

  Future<List<Article>> fetchNews(String category, int page) async {
    final url = "$baseUrl?q=$category&page=$page&apiKey=$apiKey";

    print('uri____ ${url}');
    final response = await http.get(Uri.parse(url));

    print('response body ${response.body}');
    print('status code  ${response.statusCode}');
    if (response.statusCode == 200) {
      return NewsArticle.fromJson(json.decode(response.body)).articles;
    } else {
      throw Exception("Failed to load news");
    }
  }
}