import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ["Technology", "Sports", "Entertainment"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Categories",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.blue.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Get.to(() => NewsListScreen(category: categories[index])),
              borderRadius: BorderRadius.circular(12),
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                shadowColor: Colors.black.withOpacity(0.2),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent.withOpacity(0.2),
                    radius: 30,
                    child: Icon(
                      Icons.article,
                      color: Colors.blueAccent,
                      size: 36,
                    ),
                  ),
                  title: Text(
                    categories[index],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    "Tap to explore latest news in ${categories[index]}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}