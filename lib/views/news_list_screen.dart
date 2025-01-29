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
      appBar: AppBar(
        title: Text("$category News"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            var article = controller.articles[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: article.urlToImage != null
                      ? Image.network(
                    article.urlToImage!,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                      : Icon(Icons.image, size: 50),
                ),
                title: Text(
                  article.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  article.description ?? 'No description available',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Get.to(() => NewsDetailScreen(article: article)),
              ),
            );
          },
        );
      }),
    );
  }
}