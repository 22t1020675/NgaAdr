class News {
  String title;
  String description;
  String urlToImage;
  String content;
  String url;

  News({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
    required this.url,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      content: json['content'] ?? "",
      url: json['url'] ?? "",
    );
  }
}

