import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/news_article.dart';

class ApiService {
  static const String _baseUrl = "https://newsapi.org/v2";
  static const String _apiKey = "56b8cd2b3fea457a90d85f87002e1c75";

  static Future<NewsArticle> fetchNews(String category, int page) async {
    // Construct the API endpoint with query parameters
    final url = Uri.parse(
        "$_baseUrl/everything?q=$category&from=2025-01-21&sortBy=popularity&page=$page&apiKey=$_apiKey");

    try {
      final response = await http.get(url);
      print("API response: ${response.body}");

      if (response.statusCode == 200) {
        print("API response: ${response.body}");
        return newsArticleFromJson(response.body);
      } else {
        print("Error response: ${response.statusCode} ${response.reasonPhrase}");
        throw Exception("Failed to fetch news: ${response.reasonPhrase}");
      }
    } catch (e) {
      print("Exception during API call: $e");
      rethrow;
    }
  }
}