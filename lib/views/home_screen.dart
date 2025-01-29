import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ["Technology", "Sports", "Entertainment"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Categories")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () => Get.to(() => NewsListScreen(category: categories[index])),
          );
        },
      ),
    );
  }
}