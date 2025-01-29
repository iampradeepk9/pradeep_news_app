import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controller.dart';
import 'news_detail_screen.dart';

class NewsListScreen extends StatelessWidget {
  final String category;
  final NewsController controller = Get.put(NewsController());

  NewsListScreen({required this.category}) {
    controller.fetchNews(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category News")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            var article = controller.articles[index];
            return ListTile(
              title: Text(article.title),
              subtitle: Text(article.description),
              leading: article.urlToImage != null
                  ? Image.network(article.urlToImage!, width: 100, height: 100, fit: BoxFit.cover)
                  : Icon(Icons.image),
              onTap: () => Get.to(() => NewsDetailScreen(article: article)),
            );
          },
        );
      }),
    );
  }
}