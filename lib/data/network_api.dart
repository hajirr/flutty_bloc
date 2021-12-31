import 'package:flutty_bloc/model/news_article.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  String apiKey = "be6e3c79afe642cab0c5540761bd72d7";
  final baseUrlNews = "https://newsapi.org/v2/";

  Future<List<Article>> getNewsTopHeadline() async {
    try {
      final uri =
          Uri.parse(baseUrlNews + "top-headlines?country=id&apiKey=$apiKey");
      final response = await http.get(uri);
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final news = newsModelFromJson(response.body);
        return news.articles;
      } else {
        return [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }

  Future<List<Article>> getNewsInvestment() async {
    try {
      final uri =
          Uri.parse(baseUrlNews + "everything?q=investment&apiKey=$apiKey");
      final response = await http.get(uri);
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final news = newsModelFromJson(response.body);
        return news.articles;
      } else {
        return [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }

  Future<List<Article>> getNewsTechnology() async {
    try {
      final uri =
          Uri.parse(baseUrlNews + "everything?q=technology&apiKey=$apiKey");
      final response = await http.get(uri);
      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final news = newsModelFromJson(response.body);
        return news.articles;
      } else {
        return [];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}
