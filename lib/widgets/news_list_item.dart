import 'package:flutter/material.dart';
import '../models/news_article.dart';
import '../screens/article_screen.dart';


class NewsListItem extends StatelessWidget {
  final Article article;

  NewsListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.description),
      leading: article.urlToImage != null
          ? Image.network(article.urlToImage!, width: 50, height: 50, fit: BoxFit.cover)
          : null,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(article: article),
          ),
        );
      },
    );
  }
}