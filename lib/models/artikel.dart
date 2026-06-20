class Article {
  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;

  Article({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? 0,
      title: json['title'] ?? '-',
      url: json['url'] ?? '',
      imageUrl: json['image_url'] ?? '',
      newsSite: json['news_site'] ?? '-',
      summary: json['summary'] ?? '-',
      publishedAt: json['published_at'] ?? '',
    );
  }

  // Dipakai saat passing object lewat Navigator (Detail Page)
  // dan saat menyimpan data minimal ke Firestore (collection favorites).
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'imageUrl': imageUrl,
      'newsSite': newsSite,
      'summary': summary,
      'publishedAt': publishedAt,
    };
  }
}
