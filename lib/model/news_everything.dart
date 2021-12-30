import 'dart:convert';

NewsEverythingModel newsEverythingModelFromJson(String str) =>
    NewsEverythingModel.fromJson(json.decode(str));

String newsEverythingModelToJson(NewsEverythingModel data) =>
    json.encode(data.toJson());

class NewsEverythingModel {
  NewsEverythingModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<ArticleEverything> articles;

  factory NewsEverythingModel.fromJson(Map<String, dynamic> json) =>
      NewsEverythingModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleEverything>.from(
            json["articles"].map((x) => ArticleEverything.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class ArticleEverything {
  ArticleEverything({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory ArticleEverything.fromJson(Map<String, dynamic> json) =>
      ArticleEverything(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "",
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] ?? "",
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
