import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_screen.dart';
import '../controllers/news_controller.dart';

class HomeScreen extends StatelessWidget {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Categories ")),
      body: ListView.builder(
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.categories[index]),
            onTap: () {
              Get.to(() => CategoryScreen(category: controller.categories[index]));
            },
          );
        },
      ),
    );
  }
}