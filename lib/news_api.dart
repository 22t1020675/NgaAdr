import 'package:dio/dio.dart';
import 'news.dart';

class NewsAPI {
  final Dio _dio = Dio();

  Future<List<News>> getNews() async {
    const url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7f31863e798b42128e322f85ef732545";

    try {
      final response = await _dio.get(url);

      if (response.statusCode != 200) {
        throw Exception("Lỗi API: ${response.statusCode}");
      }

      final data = response.data;
      final List articles = data["articles"] ?? [];

      return articles.map((json) => News.fromJson(json)).toList();
    } catch (e) {
      print("Lỗi khi gọi API: $e");
      return [];
    }
  }
}

NewsAPI newsApi = NewsAPI();
