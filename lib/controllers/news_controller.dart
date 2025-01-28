import 'package:get/get.dart';
import '../models/news_article.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var articles = <Article>[].obs;
  var categories = ["Technology", "Sports", "Entertainment"].obs;

  int currentPage = 1;

  void fetchNews(String category) async {
    isLoading(true);
    try {
      final newsData = await ApiService.fetchNews(category, currentPage);
      if (currentPage == 1) {
        articles.assignAll(newsData.articles);
      } else {
        articles.addAll(newsData.articles);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void loadMore(String category) {
    currentPage++;
    fetchNews(category);
  }
}
