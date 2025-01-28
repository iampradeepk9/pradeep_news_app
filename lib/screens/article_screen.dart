import 'package:flutter/material.dart';
import '../models/news_article.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  ArticleScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Image.network(article.urlToImage!, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              article.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              article.description ?? "",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              article.content,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}