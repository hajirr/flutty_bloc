import 'package:flutty_bloc/model/news.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  final baseUrlNews =
      "https://newsapi.org/v2/top-headlines?country=id&apiKey=be6e3c79afe642cab0c5540761bd72d7";

  Future<List<Article>> getNewsArticle() async {
    try {
      final uri = Uri.parse(baseUrlNews);
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
