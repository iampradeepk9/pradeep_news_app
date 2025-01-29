import 'package:get/get.dart';
import '../models/news_article.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var articles = <Article>[].obs;
  var page = 1.obs;

  final NewsService _newsService = NewsService();

  void fetchNews(String category) async {
    isLoading(true);
    try {
      var fetchedArticles = await _newsService.fetchNews(category, page.value);
      articles.addAll(fetchedArticles);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void loadMore(String category) {
    page.value++;
    fetchNews(category);
  }
}