import 'dart:convert';

NewsArticle newsArticleFromJson(String str) => NewsArticle.fromJson(json.decode(str));

String newsArticleToJson(NewsArticle data) => json.encode(data.toJson());

class NewsArticle {
  String status;
  int totalResults;
  List<Article> articles;

  NewsArticle({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) => NewsArticle(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  String title;
  String description;
  String url;
  String? urlToImage;
  String content;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    title: json["title"] ?? "No Title",
    description: json["description"] ?? "No Description Available",
    url: json["url"] ?? "",
    urlToImage: json["urlToImage"],  // Keep nullable (String?)
    content: json["content"] ?? "Content not available",
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "content": content,
  };
}