import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'article_screen.dart';
import '../controllers/news_controller.dart';

class CategoryScreen extends StatelessWidget {
  final String category;
  final NewsController controller = Get.find();

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    controller.fetchNews(category);

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                scrollInfo.metrics.maxScrollExtent) {
              controller.loadMore(category);
            }
            return true;
          },
          child: ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description ?? ""),
                  onTap: () {
                    Get.to(() => ArticleScreen(article: article));
                  },
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
