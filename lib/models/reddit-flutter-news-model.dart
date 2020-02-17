 import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String url;
  final String thumbnail;
  final String author;

  Article({
    this.title,
    this.url,
    this.author,
    this.thumbnail,
  }) : super([title, url, author, thumbnail]);

  static Article fromJson(dynamic json) {
    return Article(
      title: json['data']['title'] as String,
      url: 'https://www.reddit.com${json['data']['permalink']}',
      author: json['data']['author'] as String,
      thumbnail: json['data']['thumbnail'] as String,
    );
  }

  @override
  String toString() =>
      'Article { title: $title, url: $url, author: $author, thumbnail: $thumbnail }';
}

class NewsSearchResult {
  final List<Article> items;

  const NewsSearchResult({this.items});

  static NewsSearchResult fromJson(Map<String, dynamic> json) {
    final items = (json['data']['children'] as List<dynamic>)
        .map((dynamic item) => Article.fromJson(item as Map<String, dynamic>))
        .toList();
    return NewsSearchResult(items: items);
  }
}

class SearchResultError {}
